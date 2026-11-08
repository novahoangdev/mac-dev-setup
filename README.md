# Mac Dev & Vibe Coding Setup

**Live guide: https://setup-dev-mac.web.app**

**[English](#english) | [Tiếng Việt](#tiếng-việt)**

---

## English

A macOS (Apple Silicon) setup for vibe coding with many AI agents: Claude Code, Codex, Gemini CLI, Amp and omp running in parallel in Orca, routed through the OmniRoute gateway, on Ghostty + zellij, reachable from a phone over Tailscale + mosh.

### Structure

```text
setup-dev-mac/
├── index.html                      # Bilingual guide: steps, copy buttons, saved checklist (works offline)
├── assets/styles.css               # Prebuilt CSS for the guide (generated)
├── src/styles.css                  # CSS source + tailwind.config.js
├── Brewfile                        # All CLI tools, agents and apps (brew bundle)
├── scripts/
│   ├── export-macos-settings.sh    # Reads current macOS settings → backups/apply-my-settings.sh
│   ├── verify-setup.sh             # Health check for the whole stack
│   ├── build-css.sh                # Rebuilds assets/styles.css after editing index.html
│   └── build-site.sh               # Builds dist/ (index.html + assets only) for Firebase Hosting
├── firebase.json · .firebaserc     # Firebase Hosting config (project setup-dev-mac)
├── .github/workflows/              # Auto deploy: main → live, PR → preview URL
├── backups/
│   └── apply-my-settings.sh        # Settings restore script (generated)
├── ARCHITECTURE.md                 # Why things are the way they are
└── TODO.md                         # Open items
```

### Quick start

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/novahoangdev/setup-dev-mac.git ~/setup-dev-mac
cd ~/setup-dev-mac
brew bundle --file=Brewfile
curl -fsSL https://claude.ai/install.sh | bash   # Claude Code
bash backups/apply-my-settings.sh                # restore macOS settings
bash scripts/verify-setup.sh                     # health check
```

Shell, nvm, OmniRoute and multi-account Git setup are covered step by step in the guide: `open index.html`.

### macOS settings backup

```bash
bash scripts/export-macos-settings.sh   # on the old Mac (read-only); output is English, --vi for Vietnamese
bash backups/apply-my-settings.sh       # on the new Mac
```

### Deploy

Pushing to `main` deploys to https://setup-dev-mac.web.app via GitHub Actions; every PR gets a preview URL (7 days). Only `index.html` and `assets/` are published. Manual deploy:

```bash
firebase deploy --only hosting
```

---

## Tiếng Việt

Bộ setup macOS (Apple Silicon) cho vibe coding với nhiều AI agent: Claude Code, Codex, Gemini CLI, Amp và omp chạy song song trong Orca, đi qua gateway OmniRoute, trên Ghostty + zellij, điều khiển được từ điện thoại qua Tailscale + mosh.

### Cấu trúc

```text
setup-dev-mac/
├── index.html                      # Guide song ngữ: từng bước, nút copy, checklist lưu tiến độ (chạy offline)
├── assets/styles.css               # CSS đã build cho guide (sinh tự động)
├── src/styles.css                  # Nguồn CSS + tailwind.config.js
├── Brewfile                        # Toàn bộ CLI, agent và app (brew bundle)
├── scripts/
│   ├── export-macos-settings.sh    # Đọc setting macOS hiện tại → backups/apply-my-settings.sh
│   ├── verify-setup.sh             # Kiểm tra toàn bộ stack
│   ├── build-css.sh                # Build lại assets/styles.css sau khi sửa index.html
│   └── build-site.sh               # Tạo dist/ (chỉ index.html + assets) cho Firebase Hosting
├── firebase.json · .firebaserc     # Cấu hình Firebase Hosting (project setup-dev-mac)
├── .github/workflows/              # Auto deploy: main → live, PR → link preview
├── backups/
│   └── apply-my-settings.sh        # Script khôi phục setting (được sinh tự động)
├── ARCHITECTURE.md                 # Lý do của các quyết định
└── TODO.md                         # Việc còn mở
```

### Bắt đầu nhanh

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/novahoangdev/setup-dev-mac.git ~/setup-dev-mac
cd ~/setup-dev-mac
brew bundle --file=Brewfile
curl -fsSL https://claude.ai/install.sh | bash   # Claude Code
bash backups/apply-my-settings.sh                # khôi phục setting macOS
bash scripts/verify-setup.sh                     # kiểm tra
```

Cấu hình zsh, nvm, OmniRoute, Git nhiều tài khoản… xem chi tiết trong guide: `open index.html`.

### Sao lưu setting macOS

```bash
bash scripts/export-macos-settings.sh   # trên máy cũ (chỉ đọc), thêm --vi để in tiếng Việt
bash backups/apply-my-settings.sh       # trên máy mới
```

### Deploy

Push lên `main` sẽ tự deploy lên https://setup-dev-mac.web.app qua GitHub Actions; mỗi PR có một link preview (7 ngày). Chỉ `index.html` và `assets/` được public. Deploy tay:

```bash
firebase deploy --only hosting
```

---

Hoa Hoang · [@novahoangdev](https://github.com/novahoangdev)
