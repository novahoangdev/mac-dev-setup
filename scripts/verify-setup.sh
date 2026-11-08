#!/usr/bin/env bash
# ==============================================================================
# scripts/verify-setup.sh — health check for the Mac dev & vibe coding stack.
# Usage: bash scripts/verify-setup.sh [--vi|--en]
# Output is English by default; pass --vi for Vietnamese.
# ==============================================================================

UI_LANG=en
case "${1:-}" in --vi) UI_LANG=vi ;; --en) UI_LANG=en ;; esac

# t "English" "Tiếng Việt"
t() { if [ "$UI_LANG" = vi ]; then printf '%s' "$2"; else printf '%s' "$1"; fi; }

missing=0

check_cmd() { # check_cmd <label> <command>
  if command -v "$2" >/dev/null 2>&1; then
    echo "  ✅ $1 ($(command -v "$2"))"
  else
    echo "  ❌ $1 — $(t "not installed or not in PATH" "chưa cài hoặc chưa có trong PATH")"
    missing=$((missing + 1))
  fi
}

check_app() { # check_app <label> <App Name.app>
  if [ -d "/Applications/$2" ] || [ -d "$HOME/Applications/$2" ]; then
    echo "  ✅ $1"
  else
    echo "  ⚠️  $1 — $(t "not found" "chưa thấy") (/Applications/$2)"
    missing=$((missing + 1))
  fi
}

echo "🔍 $(t "VERIFYING MAC DEV & VIBE CODING ENVIRONMENT" "ĐANG KIỂM TRA MÔI TRƯỜNG MAC DEV & VIBE CODING")"
echo ""

echo "📦 1. Homebrew & CLI"
check_cmd "Homebrew" brew
check_cmd "eza" eza
check_cmd "bat" bat
check_cmd "ripgrep" rg
check_cmd "zoxide" zoxide
check_cmd "GitHub CLI" gh
check_cmd "lazygit" lazygit
check_cmd "delta" delta
echo ""

echo "⚡ 2. $(t "Runtimes" "Runtime")"
check_cmd "nvm (Node)" node
check_cmd "pnpm" pnpm
check_cmd "bun" bun
check_cmd "uv" uv
check_cmd "Docker CLI" docker
[ -x "$(command -v node)" ] && echo "     Node: $(node -v)"
echo ""

echo "🤖 3. $(t "AI coding agents" "AI coding agent")"
check_cmd "Claude Code" claude
check_cmd "Codex CLI" codex
check_cmd "Gemini CLI" gemini
check_cmd "Amp" amp
check_cmd "omp (Oh My Pi)" omp
check_cmd "OmniRoute" omniroute
check_app "Orca" "Orca.app"
check_app "Claude Desktop" "Claude.app"
check_app "ChatGPT" "ChatGPT.app"
echo ""

echo "🖥️  4. $(t "Terminal, remote & apps" "Terminal, remote & ứng dụng")"
check_app "Ghostty" "Ghostty.app"
check_cmd "zellij" zellij
check_cmd "tailscale" tailscale
check_cmd "mosh" mosh
check_app "Raycast" "Raycast.app"
check_app "CleanShot X" "CleanShot X.app"
check_app "Paste" "Paste.app"
check_app "Wispr Flow" "Wispr Flow.app"
check_app "OpenKey" "OpenKey.app"
check_app "Visual Studio Code" "Visual Studio Code.app"
echo ""

echo "🔑 5. Git & SSH"
echo "  user.name:  $(git config --global user.name || t "not set" "chưa thiết lập")"
echo "  pull.ff:    $(git config --global pull.ff || t "not set" "chưa thiết lập")"
echo "  core.pager: $(git config --global core.pager || t "not set" "chưa thiết lập")"
key_count=$(find "$HOME/.ssh" -maxdepth 1 -name '*.pub' 2>/dev/null | wc -l | tr -d ' ')
if [ "$key_count" -gt 0 ]; then
  echo "  ✅ $(t "SSH public keys" "Khoá SSH public"): $key_count"
else
  echo "  ❌ $(t "No SSH key found in ~/.ssh" "Không có khoá SSH trong ~/.ssh")"
  missing=$((missing + 1))
fi
echo ""

if [ "$missing" -eq 0 ]; then
  echo "🎉 $(t "All checks passed." "Mọi thứ đã sẵn sàng.")"
else
  echo "⚠️  $(t "$missing item(s) missing — see above." "Còn thiếu $missing mục — xem ở trên.")"
fi
