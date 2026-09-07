# 🚀 Ultimate Mac Dev & Vibe Coding Setup

<div align="center">

**[English](#-english) | [Tiếng Việt](#-tiếng-việt)**

*A streamlined, AI-first developer environment setup guide optimized for macOS Apple Silicon (M1/M2/M3/M4).*

</div>

---

## 🇺🇸 English

### 🌟 Overview

The **Ultimate Mac Dev & Vibe Coding Setup** is a modern, step-by-step setup guide designed specifically for developers and AI-augmented coding ("Vibe Coding"). It features an interactive web guide, one-click terminal commands, direct tool links, and automated backup/restore scripts for macOS preferences.

### ✨ Key Features

- 🌐 **Bilingual Interactive Guide (`index.html`)**: Instant switching between English and Vietnamese.
- 📚 **Documentation Navigation**: An eight-section, Previous/Next reading flow; settings export/restore and optional utilities are organized as child sections of their relevant setup chapters.
- 📋 **1-Click Copy**: Copy terminal commands and shell configs with visual toast feedback.
- 🎛️ **Build Your Own Stack**: Select only the desktop apps you want in the web guide and copy the generated Homebrew command.
- ⚡ **Vibe Coding & AI-First Stack**: Tailored for tools like Cursor, Zed, Claude Code, Starship, and MCP.
- 🐋 **Multi-Agent Orchestration**: Optional Orca desktop workspace for running CLI agents side-by-side in isolated Git worktrees.
- 🔄 **macOS Settings Backup & Restore**: One-command export of your exact trackpad gestures, keyboard repeat rates, Finder, and Dock configurations into a standalone restore script.

### 📁 Project Structure

```text
setup-dev-mac/
├── index.html                           # Interactive bilingual web setup guide & mindmap
├── README.md                            # Comprehensive documentation (EN & VI)
├── Brewfile.minimal                     # Minimal CLI, Cursor, and terminal baseline
├── Brewfile.ai                          # Optional AI coding and local-model layer
├── Brewfile.apps                        # Optional productivity desktop-app layer
├── Brewfile                             # 1-Click Homebrew bundle (CLI, runtimes & casks)
├── mise.toml                            # Pinned Node.js and Python project runtimes
├── .gitignore                           # macOS and temporary file exclusions
├── scripts/                             # Automation scripts
│   ├── export-macos-settings.en.sh      # Settings exporter (English version)
│   ├── export-macos-settings.vi.sh      # Settings exporter (Vietnamese version)
│   ├── verify-setup.en.sh               # Automated healthcheck script (English)
│   └── verify-setup.vi.sh               # Automated healthcheck script (Vietnamese)
└── backups/                             # Auto-generated restore scripts
    ├── apply-my-settings.en.sh          # Settings restore script (English)
    └── apply-my-settings.vi.sh          # Settings restore script (Vietnamese)
```

### ✅ Before You Start

- macOS on Apple Silicon (M1 or newer); this repository has not been tested on Intel Macs.
- An administrator account, an Internet connection, and several GB of free disk space. The full AI/local-model stack needs substantially more.
- Review each bundle before running it. Desktop apps may require their own accounts, licenses, or model downloads.

### 🚀 Quick Start

#### 1. Install Xcode Command Line Tools

```bash
xcode-select --install
```

macOS opens an installer window. Finish it, then confirm the tools are ready; this command must print a path before you continue:

```bash
xcode-select -p
```

#### 2. Clone the repository and install Homebrew

```bash
git clone https://github.com/hoangvanhoa1701/setup-dev-mac.git
cd setup-dev-mac
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

For Apple Silicon, load Homebrew into the current shell:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### 3. Choose a setup profile

Start with the recommended minimal baseline (CLI essentials, Cursor, and Ghostty):

```bash
brew bundle --file=Brewfile.minimal
```

Or install the complete bundle, including runtimes, AI desktop apps, local-model tools, and productivity utilities:

```bash
brew bundle --file=Brewfile
```

Or add only the layer you need after the minimal baseline:

```bash
brew bundle --file=Brewfile.ai    # Aider, VS Code, Zed, Orca, Claude, ChatGPT, Ollama, LM Studio
brew bundle --file=Brewfile.apps  # OrbStack, Raycast, Shottr, Ice, BetterDisplay, Arc
```

#### 4. Finish the developer baseline

Install the runtime versions pinned by this repository, then enable `mise` in Zsh:

```bash
mise install
grep -qxF 'eval "$(mise activate zsh)"' ~/.zshrc || echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
exec zsh
```

Set your Git identity and authenticate GitHub CLI (both commands are interactive):

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
gh auth login
```

If you do not already have an SSH key for GitHub, create one and copy the public key to add in GitHub Settings:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
pbcopy < ~/.ssh/id_ed25519.pub
```

#### 5. Open the interactive guide

```bash
open index.html
```

#### 6. Verify Your Environment Health
Run the automated verification script:
```bash
bash scripts/verify-setup.en.sh --minimal
```

Use `--ai`, `--apps`, or `--full` when verifying the corresponding layer.

#### 7. Export & Backup Your Current Mac Preferences
Scan and export all current macOS preferences (Trackpad 4-finger swipes, 2-finger click, key repeats, Finder, Dock) into the `backups/` directory:
```bash
bash scripts/export-macos-settings.en.sh
```

#### 8. Restore Preferences on Any New Mac
Transfer the generated script to your new Mac and run:
```bash
bash backups/apply-my-settings.en.sh
```
---

## 🇻🇳 Tiếng Việt

### 🌟 Giới thiệu

**Ultimate Mac Dev & Vibe Coding Setup** là cẩm nang thiết lập môi trường lập trình hiện đại từng bước, được tối ưu riêng cho Lập trình viên và phong cách làm việc AI-first ("Vibe Coding"). Dự án tích hợp giao diện web tương tác trực quan, lệnh sao chép 1-click, đường dẫn chính thức và bộ script tự động sao lưu/khôi phục cài đặt macOS.

### ✨ Tính năng nổi bật

- 🌐 **Giao diện web trực quan (`index.html`)**: Chuyển đổi ngôn ngữ Tiếng Anh / Tiếng Việt linh hoạt chỉ với 1 click.
- 📚 **Điều hướng dạng tài liệu**: Luồng đọc gồm tám phần với Previous/Next; tính năng xuất/khôi phục setting và tiện ích mở rộng được đặt làm phần con của các giai đoạn liên quan.
- 📋 **Sao chép 1-Click**: Tích hợp nút copy cho mọi câu lệnh terminal và cấu hình shell kèm thông báo toast.
- 🎛️ **Tự chọn bộ công cụ**: Tick các ứng dụng desktop cần dùng trên web guide và sao chép lệnh Homebrew được tạo tự động.
- ⚡ **Tối ưu Vibe Coding & AI**: Chuẩn hóa cấu hình cho Cursor, Zed, Claude Code, Starship prompt và MCP.
- 🐋 **Điều phối Multi-Agent**: Orca là desktop workspace tùy chọn để chạy CLI agent song song trong các Git worktree độc lập.
- 🔄 **Tự động sao lưu & Khôi phục Setting**: Trích xuất toàn bộ cử chỉ trackpad (vuốt 4 ngón, chạm 2 ngón), tốc độ phím, Finder, Dock thành script độc lập để khôi phục trên máy mới trong 2 giây.

### 📁 Cấu trúc thư mục

```text
setup-dev-mac/
├── index.html                           # Giao diện web hướng dẫn chi tiết từng bước & sơ đồ mindmap
├── README.md                            # Tài liệu dự án đầy đủ (EN & VI)
├── Brewfile.minimal                     # Preset tối giản: CLI, Cursor và terminal
├── Brewfile.ai                          # Lớp tùy chọn: AI coding và local model
├── Brewfile.apps                        # Lớp tùy chọn: các ứng dụng desktop năng suất
├── Brewfile                             # File tự động hóa cài đặt trọn gói với Homebrew
├── mise.toml                            # Runtime Node.js và Python được pin phiên bản
├── .gitignore                           # Loại trừ file tạm hệ thống macOS
├── scripts/                             # Thư mục chứa script tự động hóa
│   ├── export-macos-settings.vi.sh      # Script trích xuất cài đặt (Bản Tiếng Việt)
│   ├── export-macos-settings.en.sh      # Script trích xuất cài đặt (Bản Tiếng Anh)
│   ├── verify-setup.vi.sh               # Script kiểm tra sức khỏe môi trường (Tiếng Việt)
│   └── verify-setup.en.sh               # Script kiểm tra sức khỏe môi trường (Tiếng Anh)
└── backups/                             # Thư mục chứa file cấu hình đã xuất
    ├── apply-my-settings.vi.sh          # Script khôi phục cài đặt trên máy mới (VI)
    └── apply-my-settings.en.sh          # Script khôi phục cài đặt trên máy mới (EN)
```

### ✅ Điều kiện trước khi bắt đầu

- macOS chạy Apple Silicon (M1 trở lên); repository này chưa được kiểm thử trên Mac Intel.
- Tài khoản có quyền quản trị, Internet và vài GB dung lượng trống. Bộ AI/local model đầy đủ cần nhiều dung lượng hơn.
- Hãy xem nội dung từng bundle trước khi chạy. Một số ứng dụng desktop cần tài khoản, license hoặc tải model riêng.

### 🚀 Hướng dẫn sử dụng nhanh

#### 1. Cài Xcode Command Line Tools

```bash
xcode-select --install
```

macOS sẽ mở cửa sổ cài đặt. Hãy hoàn tất, sau đó xác nhận công cụ đã sẵn sàng; lệnh dưới đây phải in ra một đường dẫn trước khi tiếp tục:

```bash
xcode-select -p
```

#### 2. Clone repository và cài Homebrew

```bash
git clone https://github.com/hoangvanhoa1701/setup-dev-mac.git
cd setup-dev-mac
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Với Apple Silicon, nạp Homebrew vào shell hiện tại:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### 3. Chọn profile cài đặt

Bắt đầu bằng preset tối giản được khuyến nghị (CLI thiết yếu, Cursor và Ghostty):

```bash
brew bundle --file=Brewfile.minimal
```

Hoặc cài bundle đầy đủ gồm runtime, ứng dụng AI, công cụ local model và tiện ích năng suất:

```bash
brew bundle --file=Brewfile
```

Hoặc chỉ cài thêm lớp bạn cần sau preset tối giản:

```bash
brew bundle --file=Brewfile.ai    # Aider, VS Code, Zed, Orca, Claude, ChatGPT, Ollama, LM Studio
brew bundle --file=Brewfile.apps  # OrbStack, Raycast, Shottr, Ice, BetterDisplay, Arc
```

#### 4. Hoàn thiện baseline cho developer

Cài các phiên bản runtime được pin trong repository, sau đó kích hoạt `mise` trong Zsh:

```bash
mise install
grep -qxF 'eval "$(mise activate zsh)"' ~/.zshrc || echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
exec zsh
```

Thiết lập Git identity và xác thực GitHub CLI (cả hai lệnh đều tương tác):

```bash
git config --global user.name "Tên của bạn"
git config --global user.email "you@example.com"
gh auth login
```

Nếu chưa có SSH key dùng cho GitHub, tạo key và copy public key để thêm vào GitHub Settings:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
pbcopy < ~/.ssh/id_ed25519.pub
```

#### 5. Mở giao diện hướng dẫn trực quan

```bash
open index.html
```

#### 6. Kiểm tra tự động tính sẵn sàng của môi trường
Chạy script kiểm tra sức khỏe toàn bộ toolchain:
```bash
bash scripts/verify-setup.vi.sh --minimal
```

Hãy dùng `--ai`, `--apps` hoặc `--full` khi kiểm tra lớp tương ứng.

#### 7. Trích xuất cài đặt máy Mac hiện tại
Chạy script để quét và trích xuất cấu hình hệ thống vào thư mục `backups/`:
```bash
bash scripts/export-macos-settings.vi.sh
```

#### 8. Khôi phục cài đặt trên máy Mac mới
Chuyển file khôi phục sang máy Mac mới và chạy:
```bash
bash backups/apply-my-settings.vi.sh
```
---

## 👤 Author / Tác giả

* **Author**: Hoang Hoa ([@hoangvanhoa1701](https://github.com/hoangvanhoa1701))
* **Email**: [hoangvanhoa1701@gmail.com](mailto:hoangvanhoa1701@gmail.com)
* **GitHub Repository**: [https://github.com/hoangvanhoa1701/setup-dev-mac](https://github.com/hoangvanhoa1701/setup-dev-mac)
