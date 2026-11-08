#!/usr/bin/env bash
# ==============================================================================
# scripts/build-site.sh — assembles dist/ for Firebase Hosting.
# Allowlist only: the published site is index.html + assets/. Nothing else from
# the repo (scripts, backups, .git, docs) is ever uploaded.
# Runs automatically as the Hosting predeploy hook (see firebase.json).
# ==============================================================================

set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

rm -rf dist
mkdir -p dist
cp index.html dist/
cp -R assets dist/

echo "dist/: $(find dist -type f | wc -l | tr -d ' ') files"
