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
- ⚡ **Vibe Coding & AI-First Stack**: Tailored for tools like Cursor, Zed, Claude Code, Starship, and MCP.
- 🔄 **macOS Settings Backup & Restore**: One-command export of your exact trackpad gestures, keyboard repeat rates, Finder, and Dock configurations into a standalone restore script.

### 📁 Project Structure

```text
setup-dev-mac/
├── index.html                           # Interactive bilingual web setup guide & mindmap
├── README.md                            # Comprehensive documentation (EN & VI)
├── Brewfile                             # 1-Click Homebrew bundle (CLI, runtimes & casks)
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

### 🚀 Quick Start

#### 1. Open the Interactive Setup Guide
Launch the local web dashboard in your browser:
```bash
open index.html
```

#### 2. Install the Complete Stack (1-Click Automation)
Install all CLI tools, runtimes, editors, and productivity apps via Homebrew:
```bash
brew bundle --file=Brewfile
```

#### 3. Verify Your Environment Health
Run the automated verification script:
```bash
bash scripts/verify-setup.en.sh
```

#### 4. Export & Backup Your Current Mac Preferences
Scan and export all current macOS preferences (Trackpad 4-finger swipes, 2-finger click, key repeats, Finder, Dock) into the `backups/` directory:
```bash
bash scripts/export-macos-settings.en.sh
```

#### 5. Restore Preferences on Any New Mac
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
- ⚡ **Tối ưu Vibe Coding & AI**: Chuẩn hóa cấu hình cho Cursor, Zed, Claude Code, Starship prompt và MCP.
- 🔄 **Tự động sao lưu & Khôi phục Setting**: Trích xuất toàn bộ cử chỉ trackpad (vuốt 4 ngón, chạm 2 ngón), tốc độ phím, Finder, Dock thành script độc lập để khôi phục trên máy mới trong 2 giây.

### 📁 Cấu trúc thư mục

```text
setup-dev-mac/
├── index.html                           # Giao diện web hướng dẫn chi tiết từng bước & sơ đồ mindmap
├── README.md                            # Tài liệu dự án đầy đủ (EN & VI)
├── Brewfile                             # File tự động hóa cài đặt trọn gói với Homebrew
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

### 🚀 Hướng dẫn sử dụng nhanh

#### 1. Mở giao diện hướng dẫn trực quan
Mở file `index.html` trực tiếp trên trình duyệt của bạn:
```bash
open index.html
```

#### 2. Cài đặt trọn gói 1-Click
Cài đặt toàn bộ CLI tools, runtime, editor và ứng dụng qua Homebrew:
```bash
brew bundle --file=Brewfile
```

#### 3. Kiểm tra tự động tính sẵn sàng của môi trường
Chạy script kiểm tra sức khỏe toàn bộ toolchain:
```bash
bash scripts/verify-setup.vi.sh
```

#### 4. Trích xuất cài đặt máy Mac hiện tại
Chạy script để quét và trích xuất cấu hình hệ thống vào thư mục `backups/`:
```bash
bash scripts/export-macos-settings.vi.sh
```

#### 5. Khôi phục cài đặt trên máy Mac mới
Chuyển file khôi phục sang máy Mac mới và chạy:
```bash
bash backups/apply-my-settings.vi.sh
```
---

## 👤 Author / Tác giả

* **Author**: Hoang Hoa ([@hoangvanhoa1701](https://github.com/hoangvanhoa1701))
* **Email**: [hoangvanhoa1701@gmail.com](mailto:hoangvanhoa1701@gmail.com)
* **GitHub Repository**: [https://github.com/hoangvanhoa1701/setup-dev-mac](https://github.com/hoangvanhoa1701/setup-dev-mac)
