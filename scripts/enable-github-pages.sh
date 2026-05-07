#!/usr/bin/env bash
# Enable GitHub Pages from branch/path (default: gh-pages, /). Requires: gh auth, repo admin.
set -euo pipefail

BRANCH="${PAGES_BRANCH:-gh-pages}"
PATH_ROOT="${PAGES_PATH:-/}"

if ! command -v gh >/dev/null 2>&1; then
  printf 'gh is not installed or not on PATH.\n' >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  printf 'Run: gh auth login\n' >&2
  exit 1
fi

REPO_JSON="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
if gh api "repos/${REPO_JSON}/pages" >/dev/null 2>&1; then
  printf 'GitHub Pages already enabled for %s\n' "$REPO_JSON"
  gh api "repos/${REPO_JSON}/pages" --jq '{html_url, source, status, build_type}'
  exit 0
fi

TMP="$(mktemp)"
cleanup() { rm -f "$TMP"; }
trap cleanup EXIT

printf '{"build_type":"legacy","source":{"branch":"%s","path":"%s"}}' "$BRANCH" "$PATH_ROOT" >"$TMP"

gh api "repos/${REPO_JSON}/pages" -X POST --input "$TMP"

printf 'GitHub Pages enabled: %s from branch %s path %s\n' "$REPO_JSON" "$BRANCH" "$PATH_ROOT"
gh api "repos/${REPO_JSON}/pages" --jq '{html_url, source, status, build_type}'
