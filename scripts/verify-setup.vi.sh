#!/usr/bin/env bash
# ==============================================================================
# scripts/verify-setup.vi.sh (Phiên bản Tiếng Việt)
# Kiểm tra tự động trạng thái cài đặt của môi trường Mac Dev & Vibe Coding
# ==============================================================================

PROFILE="${1:---full}"
MISSING_COUNT=0
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
case "$PROFILE" in
  --minimal|--ai|--apps|--full) ;;
  *)
    echo "Cách dùng: bash scripts/verify-setup.vi.sh [--minimal|--ai|--apps|--full]"
    exit 2
    ;;
esac

echo "🔍 ĐANG KIỂM TRA MÔI TRƯỜNG MAC DEV & VIBE CODING (profile ${PROFILE#--})..."
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
    echo "  ❌ [MISSING] $name chưa được cài đặt hoặc chưa có trong PATH"
  fi
}

check_cask() {
  local name="$1"
  local app_path="$2"
  if [ -d "$app_path" ] || [ -d "$HOME/Applications/$(basename "$app_path")" ]; then
    echo "  ✅ [OK] $name (Đã cài đặt)"
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
    echo "  ❌ [MISSING] mise runtime '$runtime' chưa hoạt động. Chạy: mise install"
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

echo "⚡ 2. Runtime & Desktop tối giản:"
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
  echo "🤖 3. Lớp AI & Vibe Coding:"
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
  echo "🖥️ 4. Lớp ứng dụng năng suất:"
  check_cask "OrbStack" "/Applications/OrbStack.app"
  check_cask "Raycast" "/Applications/Raycast.app"
  check_cask "Shottr" "/Applications/Shottr.app"
  check_cask "Ice Menu Bar" "/Applications/Ice.app"
  check_cask "BetterDisplay" "/Applications/BetterDisplay.app"
  check_cask "Arc Browser" "/Applications/Arc.app"
  echo ""
fi

if [ "$PROFILE" = "--full" ]; then
  echo "🧰 5. Runtime của bundle đầy đủ:"
  check_tool "bun" "bun"
  check_tool "pnpm" "pnpm"
  check_tool "uv" "uv"
  echo ""
fi

echo "🔑 Cấu hình Git & SSH:"
if command -v git &> /dev/null; then
  echo "  Git User Name:  $(git config user.name || echo 'Chưa thiết lập')"
  echo "  Git User Email: $(git config user.email || echo 'Chưa thiết lập')"
  echo "  Default Branch: $(git config init.defaultBranch || echo 'master')"
  echo "  Commit Signing: $(git config commit.gpgsign || echo 'false')"
fi
if [ -f "$HOME/.ssh/id_ed25519" ]; then
  echo "  ✅ SSH Key Ed25519: $HOME/.ssh/id_ed25519"
else
  echo "  ⚠️ Chưa có SSH Key Ed25519 (tùy chọn cho đến khi dùng Git remote qua SSH)"
fi
echo ""

if [ "$MISSING_COUNT" -eq 0 ]; then
  echo "🎉 KIỂM TRA THÀNH CÔNG!"
else
  echo "⚠️ KIỂM TRA HOÀN TẤT VỚI $MISSING_COUNT MỤC CÒN THIẾU."
  exit 1
fi
