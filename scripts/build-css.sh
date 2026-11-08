#!/usr/bin/env bash
# ==============================================================================
# scripts/build-css.sh — rebuilds assets/styles.css from src/styles.css.
# Run after changing classes in index.html. Needs Node (npx); no project deps.
# Usage: bash scripts/build-css.sh [--watch]
# ==============================================================================

set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

npx --yes tailwindcss@3.4.17 \
  -c tailwind.config.js \
  -i src/styles.css \
  -o assets/styles.css \
  --minify "$@"
