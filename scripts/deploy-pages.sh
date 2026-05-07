#!/usr/bin/env bash
# Deploy static site to the GitHub Pages branch (default: gh-pages) without mutating
# the main working tree. Override folder with DEPLOY_SOURCE_REL.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

SOURCE_REL="${DEPLOY_SOURCE_REL:-Projects/Marketing Site}"
SOURCE="$ROOT/$SOURCE_REL"
BRANCH="${PAGES_BRANCH:-gh-pages}"
REMOTE="${GIT_REMOTE:-origin}"

if [[ ! -d "$SOURCE" ]]; then
  printf 'Deploy source not found: %s\n' "$SOURCE" >&2
  exit 1
fi

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  printf 'Not a git repository: %s\n' "$ROOT" >&2
  exit 1
fi

REMOTE_URL="$(git remote get-url "$REMOTE")"

TMP="$(mktemp -d)"
cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

git clone "$ROOT" "$TMP/deploy"
cd "$TMP/deploy"

git remote set-url origin "$REMOTE_URL"
git fetch origin "$BRANCH" 2>/dev/null || true

if git rev-parse "origin/$BRANCH" >/dev/null 2>&1; then
  git checkout -B "$BRANCH" "origin/$BRANCH"
else
  git checkout --orphan "$BRANCH"
  git rm -rf . 2>/dev/null || true
fi

find . -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +

rsync -a --delete \
  --exclude '.git' \
  --exclude '.DS_Store' \
  "$SOURCE/" ./

# Bust caches: gallery JPEGs + main CSS/JS (mobile Safari aggressively caches styles.css).
if [[ -f index.html ]]; then
  V="$(git -C "$ROOT" rev-parse --short HEAD)"
  if grep -q 'images/gallery/' index.html; then
    sed -i '' -E 's|src="(images/gallery/[^"?]+\.jpg)(\?[^"]*)?"|src="\1?v='"$V"'"|g' index.html
  fi
  sed -i '' -E 's|(href="styles\.css)(\?[^"]*)?"|\1?v='"$V"'"|g' index.html
  sed -i '' -E 's|(src="script\.js)(\?[^"]*)?"|\1?v='"$V"'"|g' index.html
fi

git add -A
if git diff --staged --quiet 2>/dev/null; then
  printf 'No file changes to deploy for %s.\n' "$BRANCH"
else
  git commit -m "Deploy ${BRANCH} $(date -u +%Y-%m-%dT%H:%M:%SZ)"
fi

git push origin "$BRANCH" --force

printf 'Pushed %s to %s:%s\n' "$SOURCE_REL" "$REMOTE" "$BRANCH"
