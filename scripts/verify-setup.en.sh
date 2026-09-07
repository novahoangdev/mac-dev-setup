#!/usr/bin/env bash
# ==============================================================================
# scripts/verify-setup.en.sh (English Version)
# Automated health check verification for Mac Dev & Vibe Coding environment
# ==============================================================================

PROFILE="${1:---full}"
MISSING_COUNT=0
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
case "$PROFILE" in
  --minimal|--ai|--apps|--full) ;;
  *)
    echo "Usage: bash scripts/verify-setup.en.sh [--minimal|--ai|--apps|--full]"
    exit 2
    ;;
esac

echo "🔍 VERIFYING MAC DEV & VIBE CODING ENVIRONMENT (${PROFILE#--} profile)..."
echo ""

check_tool() {
  local name="$1"
  local cmd="$2"
  if [ -z "$cmd" ]; then cmd="$name"; fi

  if command -v "$cmd" &> /dev/null; then
    local path
    path=$(which "$cmd")
    echo "  ✅ [OK] $name ($path)"
  else
    MISSING_COUNT=$((MISSING_COUNT + 1))
    echo "  ❌ [MISSING] $name is not installed or not in PATH"
  fi
}

check_cask() {
  local name="$1"
  local app_path="$2"
  if [ -d "$app_path" ] || [ -d "$HOME/Applications/$(basename "$app_path")" ]; then
    echo "  ✅ [OK] $name (Installed)"
  else
    MISSING_COUNT=$((MISSING_COUNT + 1))
    echo "  ⚠️ [NOT FOUND] $name ($app_path)"
  fi
}

check_mise_runtime() {
  local runtime="$1"
  if mise current "$runtime" &> /dev/null; then
    echo "  ✅ [OK] mise $runtime ($(mise current "$runtime"))"
  else
    MISSING_COUNT=$((MISSING_COUNT + 1))
    echo "  ❌ [MISSING] mise runtime '$runtime' is not active. Run: mise install"
  fi
}

echo "📦 1. Package Manager & CLI Core:"
check_tool "Homebrew" "brew"
check_tool "Git" "git"
check_tool "Starship Prompt" "starship"
check_tool "eza" "eza"
check_tool "bat" "bat"
check_tool "ripgrep" "rg"
check_tool "fzf" "fzf"
check_tool "zoxide" "zoxide"
check_tool "GitHub CLI" "gh"
check_tool "tldr" "tldr"
check_tool "jq" "jq"
check_tool "yq" "yq"
echo ""

echo "⚡ 2. Minimal Runtime & Desktop Baseline:"
check_tool "mise" "mise"
if command -v mise &> /dev/null && [ -f "$REPO_ROOT/mise.toml" ]; then
  ORIGINAL_DIR="$PWD"
  cd "$REPO_ROOT" || exit 1
  check_mise_runtime "node"
  check_mise_runtime "python"
  cd "$ORIGINAL_DIR" || exit 1
fi
check_cask "Cursor" "/Applications/Cursor.app"
check_cask "Ghostty" "/Applications/Ghostty.app"
echo ""

if [ "$PROFILE" = "--ai" ] || [ "$PROFILE" = "--full" ]; then
  echo "🤖 3. AI & Vibe Coding Layer:"
  check_tool "aider" "aider"
  check_tool "ollama" "ollama"
  check_cask "Orca" "/Applications/Orca.app"
  check_cask "Visual Studio Code" "/Applications/Visual Studio Code.app"
  check_cask "Zed" "/Applications/Zed.app"
  check_cask "Claude Desktop" "/Applications/Claude.app"
  check_cask "ChatGPT" "/Applications/ChatGPT.app"
  check_cask "LM Studio" "/Applications/LM Studio.app"
  echo ""
fi

if [ "$PROFILE" = "--apps" ] || [ "$PROFILE" = "--full" ]; then
  echo "🖥️ 4. Productivity Apps Layer:"
  check_cask "OrbStack" "/Applications/OrbStack.app"
  check_cask "Raycast" "/Applications/Raycast.app"
  check_cask "Shottr" "/Applications/Shottr.app"
  check_cask "Ice Menu Bar" "/Applications/Ice.app"
  check_cask "BetterDisplay" "/Applications/BetterDisplay.app"
  check_cask "Arc Browser" "/Applications/Arc.app"
  echo ""
fi

if [ "$PROFILE" = "--full" ]; then
  echo "🧰 5. Full Bundle Runtimes:"
  check_tool "bun" "bun"
  check_tool "pnpm" "pnpm"
  check_tool "uv" "uv"
  echo ""
fi

echo "🔑 Git & SSH Configuration:"
if command -v git &> /dev/null; then
  echo "  Git User Name:  $(git config user.name || echo 'Not configured')"
  echo "  Git User Email: $(git config user.email || echo 'Not configured')"
  echo "  Default Branch: $(git config init.defaultBranch || echo 'master')"
  echo "  Commit Signing: $(git config commit.gpgsign || echo 'false')"
fi
if [ -f "$HOME/.ssh/id_ed25519" ]; then
  echo "  ✅ SSH Key Ed25519: $HOME/.ssh/id_ed25519"
else
  echo "  ⚠️ SSH Key Ed25519: not found (optional until you use SSH Git remotes)"
fi
echo ""

if [ "$MISSING_COUNT" -eq 0 ]; then
  echo "🎉 VERIFICATION PASSED!"
else
  echo "⚠️ VERIFICATION FINISHED WITH $MISSING_COUNT MISSING ITEM(S)."
  exit 1
fi
