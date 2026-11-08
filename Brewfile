# ==============================================================================
# Brewfile — Mac dev & vibe coding stack
# Install: brew bundle --file=Brewfile
# Check:   brew bundle check --file=Brewfile
# Third-party taps are added automatically from the "user/tap/name" form.
# Claude Code is installed separately with its native installer (auto-updates):
#   curl -fsSL https://claude.ai/install.sh | bash
# ==============================================================================

# --- Modern CLI ---------------------------------------------------------------
brew "eza"            # ls
brew "bat"            # cat
brew "ripgrep"        # grep
brew "zoxide"         # cd
brew "gh"             # GitHub CLI
brew "lazygit"        # git TUI
brew "git-delta"      # git diff pager

# --- Runtimes -----------------------------------------------------------------
brew "nvm"            # Node (default alias: 26); pnpm comes from `npm i -g pnpm`
brew "bun"
brew "uv"             # Python + tools (uv tool install …)

# --- AI coding agents ---------------------------------------------------------
cask "codex"                      # OpenAI Codex CLI
brew "gemini-cli"                 # Google Gemini CLI
brew "ampcode/tap/ampcode"        # Amp
brew "can1357/tap/omp"            # Oh My Pi harness
cask "stablyai/orca/orca"         # Orca: parallel agents in git worktrees
cask "claude"                     # Claude Desktop
cask "chatgpt"

# --- Terminal & remote --------------------------------------------------------
cask "ghostty"
cask "font-jetbrains-mono-nerd-font"
brew "zellij"                     # persistent sessions / panes
brew "tailscale"                  # private network to reach this Mac
brew "mosh"                       # roaming SSH
brew "rjyo/moshi/moshi-hook"      # agent approvals on the Moshi phone app

# --- Editors, containers & dev apps ------------------------------------------
cask "visual-studio-code"
cask "webstorm"
cask "docker-desktop"
cask "tableplus"
cask "postman"
cask "sourcetree"

# --- Productivity -------------------------------------------------------------
cask "raycast"
cask "cleanshot"
cask "paste"
cask "wispr-flow"                 # voice → prompt
cask "openkey"                    # Vietnamese input
cask "google-chrome"
cask "slack"
cask "discord"

# --- Optional: mobile / native toolchain (uncomment when needed) -------------
# brew "cocoapods"
# brew "openjdk@17"
# cask "android-commandlinetools"
# brew "cameroncooke/axe/axe"     # iOS Simulator automation for agents
# brew "go"
# brew "rust"
# brew "ffmpeg"
