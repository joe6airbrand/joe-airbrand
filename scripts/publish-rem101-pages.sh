#!/usr/bin/env bash
# Create (if needed) github.com/<you>/rem-101-studios, push Projects/rem-101-studios to gh-pages,
# and enable GitHub Pages. Requires: gh auth (gh auth login), git.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v gh >/dev/null 2>&1; then
  printf 'Install GitHub CLI: brew install gh\n' >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  printf 'Run: gh auth login\n' >&2
  exit 1
fi

REPO_NAME="rem-101-studios"
OWNER_LOGIN="$(gh api user -q .login)"
FULL_REPO="${OWNER_LOGIN}/${REPO_NAME}"

if ! gh repo view "$FULL_REPO" >/dev/null 2>&1; then
  gh repo create "$REPO_NAME" --public --description "rem-101-studios static gallery"
fi

REMOTE_NAME="rem101"
REMOTE_URL="https://github.com/${FULL_REPO}.git"

if git remote get-url "$REMOTE_NAME" >/dev/null 2>&1; then
  current="$(git remote get-url "$REMOTE_NAME")"
  if [[ "$current" != "$REMOTE_URL" ]]; then
    git remote set-url "$REMOTE_NAME" "$REMOTE_URL"
  fi
else
  git remote add "$REMOTE_NAME" "$REMOTE_URL"
fi

GIT_REMOTE="$REMOTE_NAME" DEPLOY_SOURCE_REL="Projects/rem-101-studios" "$ROOT/scripts/deploy-pages.sh"

GH_PAGES_REPO="$FULL_REPO" "$ROOT/scripts/enable-github-pages.sh"

printf '\nPublic site (after Pages finishes building, usually under a minute):\n'
printf 'https://%s.github.io/%s/\n' "$OWNER_LOGIN" "$REPO_NAME"
