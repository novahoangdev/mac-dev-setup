# 📋 TODO Roadmap — Mac Dev & Vibe Coding Setup

## 🚨 Priority 1: Critical Improvements (Do First)

### 1.1 Modularize index.html
**Problem:** 317KB monolithic HTML file, hard to maintain and slow to load.

**Action:**
- [ ] Extract JavaScript into separate modules:
  - `js/i18n.js` - Language switching logic
  - `js/navigation.js` - Sidebar & doc page navigation
  - `js/interactions.js` - Copy buttons, toast notifications, progress tracking
- [ ] Move section content to JSON:
  - `data/sections-en.json` - English content
  - `data/sections-vi.json` - Vietnamese content
- [ ] Extract custom CSS to `css/custom.css`
- [ ] Implement lazy loading for sections (load on scroll/click)
- [ ] Add service worker for offline support

**Benefits:**
- 80%+ faster initial page load
- Better browser caching
- Easier A/B testing per section
- Git diffs become readable

---

### 1.2 Add Missing Critical Files

- [ ] `LICENSE` - Add MIT License (recommended for open-source dev tools)
- [ ] `CONTRIBUTING.md` - Guidelines for community contributions
- [ ] `CHANGELOG.md` - Track version releases and breaking changes
- [ ] `.gitattributes` - Configure Git LFS for large assets
- [ ] `CODE_OF_CONDUCT.md` - Community standards
- [ ] `.github/ISSUE_TEMPLATE/` - Bug report & feature request templates
- [ ] `.github/PULL_REQUEST_TEMPLATE.md` - PR checklist

---

### 1.3 Add CI/CD Automation

Create `.github/workflows/verify.yml`:
```yaml
name: Verify Setup Scripts
on: [push, pull_request]
jobs:
  lint-brewfiles:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Homebrew
        run: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      - name: Validate Brewfile syntax
        run: |
          brew bundle --file=Brewfile.minimal --no-lock --dry-run
          brew bundle --file=Brewfile.ai --no-lock --dry-run
          brew bundle --file=Brewfile.apps --no-lock --dry-run
          brew bundle --file=Brewfile --no-lock --dry-run
      - name: Check shell scripts
        run: |
          shellcheck scripts/*.sh || true
```

---

## 🎯 Priority 2: User Experience Enhancements

### 2.1 Add Visual Setup Progress Tracker

**Problem:** Users don't know which phase they've completed.

**Solution:**
- [ ] Add interactive checklist in index.html
- [ ] Persist progress in localStorage
- [ ] Show percentage completion in header (already there, make functional)
- [ ] Add "Resume from Phase X" quick start

---

### 2.2 Improve Brewfile Documentation

**Current issues:**
- ✅ ~~Brewfile.minimal lacks inline comments~~ (FIXED)
- [ ] Brewfile.ai needs tool descriptions
- [ ] Brewfile.apps needs use-case examples
- [ ] Main Brewfile should reference the modular approach

**Add to each tool:**
```ruby
# Tool Name - One-line description
# Use case: When to use this
# Alternative: What it replaces
brew "tool"
```

---

### 2.3 Add Screenshots to README

- [ ] Add hero screenshot of index.html in dark mode
- [ ] Show before/after terminal comparison (default zsh vs configured)
- [ ] Demonstrate Cursor + Ghostty + Starship in action
- [ ] Show the mindmap section (most visually impressive)

---

## 🔧 Priority 3: Technical Debt & Edge Cases

### 3.1 Add Rollback/Uninstall Script

**Problem:** Users may want to revert changes.

- [ ] Create `scripts/uninstall.en.sh` and `scripts/uninstall.vi.sh`
- [ ] Document uninstall steps in README
- [ ] Add "What gets modified" section before installation

---

### 3.2 Handle Intel Mac Compatibility

**Current:** README states "not tested on Intel Macs."

**Options:**
1. Add explicit Intel Mac support with different brew paths
2. Add detection script that warns/blocks Intel users
3. Document Intel limitations clearly

Recommended: Option 2 (detect and warn)

- [ ] Add architecture detection to verify-setup script:
```bash
if [[ "$(uname -m)" != "arm64" ]]; then
  echo "⚠️  WARNING: This setup is optimized for Apple Silicon (M1+)"
  echo "    Some tools may not work correctly on Intel Macs."
  read -p "Continue anyway? (y/N) " -n 1 -r
  [[ ! $REPLY =~ ^[Yy]$ ]] && exit 1
fi
```

---

### 3.3 Add Version Pinning Strategy

**Problem:** `mise.toml` only pins major versions (Node 22, Python 3.13).

**Considerations:**
- Major pinning is good for flexibility
- Add `.tool-versions` for stricter reproducibility
- Document when to use mise vs Docker for full reproducibility

- [ ] Add `.tool-versions` example
- [ ] Document trade-offs in README
- [ ] Add Dockerfile for containerized reproducible environment (optional)

---

## 🚀 Priority 4: Advanced Features (Nice to Have)

### 4.1 Add dotfiles Management

Many setup guides include dotfiles. Consider adding:

- [ ] `dotfiles/` directory with:
  - `.zshrc` with optimal aliases
  - `.gitconfig` with useful aliases
  - `starship.toml` with custom prompt
  - Cursor `settings.json` preset
- [ ] `scripts/symlink-dotfiles.sh` to install them

**Alternative:** Link to separate dotfiles repo to keep this repo focused.

---

### 4.2 Add MCP (Model Context Protocol) Setup

**Current:** README mentions "MCP" but doesn't document it.

- [ ] Add section in index.html for MCP setup
- [ ] Document which AI tools support MCP (Claude Desktop, Cursor, Zed)
- [ ] Provide example MCP server configurations
- [ ] Add `Brewfile.mcp` layer?

---

### 4.3 Interactive Installation Wizard

**Vision:** CLI wizard that asks questions and generates custom Brewfile.

```bash
bash scripts/wizard.sh
# → Asks about use case (web dev, ML, DevOps, mobile)
# → Generates personalized Brewfile
# → Runs installation
```

- [ ] Create `scripts/wizard.sh`
- [ ] Add use-case presets (web, ML, DevOps, mobile)
- [ ] Generate custom `Brewfile.custom`

---

### 4.4 Add Post-Install Configuration Scripts

**After tools are installed, users still need to configure them:**

- [ ] `scripts/configure-cursor.sh` - Install extensions, set keybindings
- [ ] `scripts/configure-ghostty.sh` - Apply optimal settings
- [ ] `scripts/configure-git.sh` - Set up global aliases, diff tools
- [ ] `scripts/setup-ssh-keys.sh` - Generate & add to GitHub/GitLab

---

## 📊 Priority 5: Analytics & Feedback

### 5.1 Add Usage Analytics (Optional)

**Privacy-respecting options:**
- [ ] Add optional telemetry prompt in verify-setup script
- [ ] Track which Brewfile layers are most popular
- [ ] Collect anonymous error reports
- [ ] Use Plausible/Fathom (privacy-focused analytics)

**Alternative:** Just add GitHub Discussions for community feedback.

---

### 5.2 Add Community Showcase

- [ ] Create `SHOWCASE.md` with user setups
- [ ] Add "Share your setup" call-to-action in README
- [ ] Create GitHub Discussion categories:
  - Show & Tell
  - Q&A
  - Feature Requests
  - Tool Recommendations

---

## 🌍 Priority 6: Internationalization Expansion

**Current:** EN + VI support

**Potential additions:**
- [ ] Add Japanese (日本語) - Large dev community
- [ ] Add Korean (한국어) - Growing Apple Silicon adoption
- [ ] Add Chinese Simplified (简体中文)
- [ ] Add Spanish (Español)

**Implementation:**
- Crowdsource translations via GitHub Issues
- Use Crowdin or similar platform
- Keep EN as source of truth

---

## 📚 Priority 7: Documentation Improvements

### 7.1 Add Troubleshooting Guide

Create `TROUBLESHOOTING.md`:

- [ ] Common errors and solutions
- [ ] "Homebrew installation hangs" → Check Xcode CLT
- [ ] "mise install fails" → Check Rosetta 2
- [ ] "Permission denied" → Fix directory ownership
- [ ] Network issues behind corporate proxy

---

### 7.2 Add Comparison with Alternatives

**Users want to know: Why this setup vs others?**

Add section comparing with:
- Homebrew's own minimal setup
- thoughtbot/laptop
- mathiasbynens/dotfiles
- donnemartin/dev-setup

Highlight:
- ✅ AI-first focus (Cursor, Aider, Orca)
- ✅ Modular layers (minimal → full)
- ✅ Bilingual support
- ✅ Backup/restore automation
- ✅ Apple Silicon optimized

---

### 7.3 Add Video Walkthrough

- [ ] Record 5-10 min setup video
- [ ] Upload to YouTube
- [ ] Add to README
- [ ] Show real-time installation

---

## 🎨 Priority 8: Design Polish

### 8.1 Add Favicons & Meta Tags

- [ ] Generate favicon set (16x16 to 512x512)
- [ ] Add Open Graph tags for social sharing
- [ ] Add Twitter Card tags
- [ ] Create social preview image (1200x630)

---

### 8.2 Improve Mobile Experience

**Current:** Mobile nav exists but could be better.

- [ ] Test on actual iOS devices
- [ ] Add pull-to-refresh on mobile
- [ ] Optimize touch targets (44x44px minimum)
- [ ] Add "Install as PWA" prompt
- [ ] Test landscape orientation

---

## 🔒 Priority 9: Security Hardening

### 9.1 Add Security Best Practices

- [ ] Document macOS security settings (Gatekeeper, FileVault)
- [ ] Add section on SSH key management
- [ ] Document GPG signing for Git commits
- [ ] Add password manager recommendation (1Password, Bitwarden)
- [ ] Document secure environment variable storage

---

### 9.2 Add Verification Checksums

- [ ] Add SHA256 checksums for downloaded scripts
- [ ] Document how to verify script integrity
- [ ] Add PGP signature for releases (advanced)

---

## 🧪 Priority 10: Testing & Quality Assurance

### 10.1 Automated Testing

- [ ] Create VM test environment (Parallels/VMware)
- [ ] Test clean macOS install → full setup
- [ ] Test each Brewfile layer independently
- [ ] Add integration tests for verify-setup script

---

### 10.2 User Testing

- [ ] Recruit 5-10 beta testers
- [ ] Track time-to-complete for each phase
- [ ] Collect feedback on unclear instructions
- [ ] A/B test different onboarding flows

---

## 📅 Suggested Implementation Timeline

### Week 1-2: Foundation (Priority 1)
- Modularize index.html
- Add missing critical files
- Set up CI/CD

### Week 3-4: UX Improvements (Priority 2)
- Visual progress tracker
- Improve Brewfile docs
- Add screenshots

### Week 5-6: Polish & Launch (Priority 3, 7, 8)
- Handle edge cases
- Complete documentation
- Design polish
- Launch on Product Hunt / Hacker News

### Ongoing: Community & Features (Priority 4-10)
- Gather feedback
- Add advanced features
- Expand i18n
- Security hardening

---

## 🎯 Success Metrics

Track these to measure project success:

- [ ] GitHub stars (target: 1000+)
- [ ] Successful installations (via optional telemetry)
- [ ] Community contributions (PRs, issues)
- [ ] Average time to complete setup (target: < 30 min for minimal)
- [ ] User satisfaction score (via survey)

---

## 🤝 How to Contribute

See `CONTRIBUTING.md` (to be created) for:
- How to suggest tool additions
- How to improve translations
- How to report bugs
- Code style guidelines

---

**Last Updated:** 2026-09-08
**Maintained by:** @hoangvanhoa1701
