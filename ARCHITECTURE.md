# 🏗️ Architecture Decision Record (ADR)

## Purpose
Document key architectural decisions for the Mac Dev & Vibe Coding Setup project.

---

## ADR-001: Modular Brewfile Strategy

**Status:** ✅ Implemented

**Context:**
Users have different needs: some want minimal setup, others want the full AI stack.

**Decision:**
Split into 4 layers:
1. `Brewfile.minimal` - Essential CLI + Cursor + Ghostty (~15 tools)
2. `Brewfile.ai` - AI coding stack (Aider, Orca, Claude, Ollama, etc.)
3. `Brewfile.apps` - Productivity apps (Raycast, Shottr, Arc, etc.)
4. `Brewfile` - Complete bundle (all of the above)

**Consequences:**
- ✅ Users can start minimal and grow
- ✅ Faster initial setup for newcomers
- ✅ Easier to maintain separate concerns
- ⚠️ Need clear docs on installation order

---

## ADR-002: Bilingual Support (EN + VI)

**Status:** ✅ Implemented

**Context:**
Vietnamese developer community is growing, but most setup guides are English-only.

**Decision:**
Full bilingual support via:
- `data-lang-en` / `data-lang-vi` attributes in HTML
- Separate `.en.sh` / `.vi.sh` script versions
- Side-by-side EN/VI sections in README

**Consequences:**
- ✅ Wider audience reach
- ✅ Better learning for non-native English speakers
- ⚠️ Double maintenance effort for content updates
- ⚠️ Need to keep translations in sync

**Future:** Consider crowdsourcing translations for other languages.

---

## ADR-003: Interactive HTML Guide vs Static README

**Status:** ✅ Implemented (index.html)

**Context:**
README.md is great for GitHub, but lacks interactivity for complex setup flows.

**Decision:**
Create `index.html` as the primary guide with:
- Copy-paste buttons with toast feedback
- Visual progress tracking
- Language switching without page reload
- Section navigation (Previous/Next)
- Responsive mobile design

Keep README as a quickstart reference.

**Consequences:**
- ✅ Better UX for following multi-step instructions
- ✅ Lower cognitive load (one section at a time)
- ✅ Works offline (single HTML file)
- ⚠️ File grew to 317KB (needs modularization)
- ⚠️ Harder to preview on GitHub (not rendered)

**Mitigation:** 
- Add prominent "Open index.html" instruction in README
- Plan to modularize HTML into smaller modules (TODO)

---

## ADR-004: mise over asdf/nvm/pyenv

**Status:** ✅ Implemented

**Context:**
Traditional runtime managers:
- `nvm` (Node), `pyenv` (Python), `rbenv` (Ruby) - separate tools
- `asdf` - unified but slow (shell-based)

**Decision:**
Use `mise` (formerly rtx):
- Written in Rust (fast)
- Unified tool for all runtimes
- asdf-compatible plugin system
- Better performance than asdf
- Active development

**Consequences:**
- ✅ Single tool to learn
- ✅ 10-100x faster than asdf
- ✅ Compatible with existing `.tool-versions`
- ⚠️ Smaller community than asdf
- ⚠️ Newer tool (less battle-tested)

**Alternatives considered:**
- `asdf` - Rejected (too slow)
- `proto` - Too new, smaller ecosystem
- `devbox` - Nix-based, steep learning curve

---

## ADR-005: Cursor as Primary Editor

**Status:** ✅ Implemented

**Context:**
AI-first development requires tight editor integration.

**Decision:**
Recommend `Cursor` as the primary editor:
- VSCode fork with native AI pair programming
- Compatible with VSCode extensions
- Built-in Claude/GPT-4 integration
- Composer mode for multi-file edits

Also include:
- `Zed` (fast, Rust-based alternative)
- `VS Code` (for those who prefer stock)

**Consequences:**
- ✅ Best-in-class AI coding experience
- ✅ Familiar VSCode UX
- ⚠️ Requires Cursor subscription for best features
- ⚠️ Privacy concerns (code sent to AI providers)

**Alternatives considered:**
- VS Code + Copilot - Less integrated AI experience
- Zed alone - Less mature ecosystem
- JetBrains IDEs - Heavy, not AI-first

---

## ADR-006: Ghostty over iTerm2/Alacritty

**Status:** ✅ Implemented

**Context:**
Need fast, GPU-accelerated terminal for modern CLI tools.

**Decision:**
Use `Ghostty` (Mitchell Hashimoto's new terminal):
- GPU-accelerated rendering
- Native macOS feel
- Zig-based (fast, memory-safe)
- Active development by trusted author

**Consequences:**
- ✅ Fastest terminal on macOS
- ✅ Low resource usage
- ✅ Great font rendering
- ⚠️ Very new (v1.0 just released)
- ⚠️ Smaller community than iTerm2
- ⚠️ Fewer customization options than Kitty

**Alternatives considered:**
- iTerm2 - Popular but heavy, slow rendering
- Alacritty - Fast but minimal features
- Kitty - Linux-first design, macOS is second-class
- Warp - AI features but closed-source, telemetry

---

## ADR-007: Starship over Oh My Zsh

**Status:** ✅ Implemented

**Context:**
Need fast, informative shell prompt with Git integration.

**Decision:**
Use `Starship` prompt:
- Cross-shell (Zsh, Bash, Fish)
- Written in Rust (fast)
- Minimal config needed
- Great default Git status
- No plugin system needed

**Consequences:**
- ✅ 10-100x faster than Oh My Zsh
- ✅ Consistent across shells
- ✅ Single TOML config file
- ⚠️ Fewer themes than Oh My Zsh
- ⚠️ Need plugins for other features (auto-suggestions, syntax highlighting)

**Alternatives considered:**
- Oh My Zsh - Rejected (slow, bloated)
- Powerlevel10k - Fast but Zsh-only
- Pure - Minimal but less informative

---

## ADR-008: Backup/Restore over Manual Configuration

**Status:** ✅ Implemented

**Context:**
macOS system preferences (trackpad, keyboard, Dock) are tedious to reconfigure manually.

**Decision:**
Provide automated backup/restore scripts:
- `export-macos-settings.sh` - Scan and generate restore script
- `apply-my-settings.sh` - One-command restore on new Mac

Use `defaults` command to read/write preferences.

**Consequences:**
- ✅ Reproducible system configuration
- ✅ Saves hours on new Mac setup
- ✅ Self-contained (no external dependencies)
- ⚠️ `defaults` keys can change between macOS versions
- ⚠️ Some settings require logout/restart

**Alternatives considered:**
- Mackup - More comprehensive but requires external storage
- Manual checklist - Time-consuming, error-prone
- Ansible playbooks - Overkill for this use case

---

## ADR-009: Single HTML File vs Multi-Page Site

**Status:** ⚠️ Needs Revision (see TODO.md)

**Context:**
Web guide started as single `index.html` for simplicity and offline use.

**Decision (original):**
Single HTML file with all content embedded.

**Consequences:**
- ✅ Works offline without web server
- ✅ Easy to distribute (download one file)
- ✅ No build step needed
- ❌ File grew to 317KB (slow to load)
- ❌ Hard to maintain (4176 lines)
- ❌ Poor Git diffs

**Revised Decision (planned):**
Modularize into:
- `index.html` - Shell (navigation, layout)
- `js/*.js` - Logic modules
- `data/*.json` - Content (EN/VI)
- `css/custom.css` - Styles

Keep offline support with service worker.

**See:** TODO.md Priority 1.1

---

## ADR-010: Homebrew Cask over Mac App Store

**Status:** ✅ Implemented

**Context:**
Apps can be installed via Homebrew cask or Mac App Store.

**Decision:**
Prefer Homebrew cask when available:
- Scriptable installation
- No Apple ID required
- Consistent with CLI tool workflow
- Can install multiple apps in one command

Use Mac App Store only when no cask exists.

**Consequences:**
- ✅ Fully automated setup
- ✅ Works on corporate machines without App Store access
- ⚠️ Some apps have cask version lag
- ⚠️ No automatic updates via App Store

**Examples:**
- Raycast, Cursor, Arc - via cask ✅
- Xcode, Final Cut Pro - via App Store (no cask)

---

## ADR-011: Git Submodules vs Vendoring

**Status:** ✅ N/A (No dependencies)

**Context:**
Project has no external dependencies currently, but may in future.

**Decision:**
If external tools/configs are needed, vendor them (copy into repo) rather than use Git submodules.

**Rationale:**
- Submodules are complex for contributors
- Vendoring ensures reproducibility
- Works offline without recursive clone

**Example:** If adding pre-configured dotfiles, copy them into `dotfiles/` rather than submodule link.

---

## ADR-012: Automated Tests vs Manual Verification

**Status:** ⚠️ Partial (manual script exists)

**Context:**
Need to verify setup works correctly.

**Current Implementation:**
`scripts/verify-setup.sh` - Manual shell script

**Future Decision Needed:**
Add automated CI tests that:
- Run on every PR
- Test each Brewfile layer
- Validate shell scripts with shellcheck
- Test on fresh macOS VM

**See:** TODO.md Priority 1.3

---

## ADR-013: Open Source License Choice

**Status:** ⚠️ TODO (No LICENSE file yet)

**Context:**
Project needs a license for community contributions.

**Recommended Decision:**
Use **MIT License**:
- Most permissive
- Allows commercial use
- Industry standard for dev tools
- Simple and short

**Alternatives considered:**
- Apache 2.0 - More verbose, patent grant
- GPL-3.0 - Too restrictive for setup guide
- Unlicense - Too permissive, no liability protection

**See:** TODO.md Priority 1.2

---

## ADR-014: Versioning Strategy

**Status:** ⚠️ TODO (No semantic versioning yet)

**Context:**
Project will evolve; need clear version history.

**Recommended Decision:**
Adopt **Semantic Versioning (SemVer)**:
- Major: Breaking changes (e.g., remove tool, change Brewfile structure)
- Minor: New features (e.g., add new tool, new section)
- Patch: Bug fixes, typos, doc improvements

Tag releases on GitHub: `v1.0.0`, `v1.1.0`, etc.

Document changes in `CHANGELOG.md`.

**See:** TODO.md Priority 1.2

---

## ADR-015: Telemetry and Privacy

**Status:** ✅ No telemetry (privacy-first)

**Context:**
Would be useful to know which tools are popular, which phases fail.

**Decision:**
**No built-in telemetry or analytics.**

**Rationale:**
- Respects user privacy
- No consent prompt needed
- Aligns with developer values
- Builds trust with community

**Alternative:** Use GitHub Stars, Issues, and Discussions for feedback instead.

**Future:** If telemetry is added, it must be:
- Opt-in only
- Privacy-respecting (no PII)
- Anonymous
- Local-first (Plausible/Fathom, not Google Analytics)

---

## ADR-016: Documentation Language

**Status:** ✅ Markdown for docs, HTML for interactive guide

**Context:**
Need to choose documentation format.

**Decision:**
- `*.md` files for static docs (README, TODO, this file)
- `index.html` for interactive guide
- Inline comments for shell scripts and Brewfiles

**Consequences:**
- ✅ Markdown renders nicely on GitHub
- ✅ HTML allows interactivity
- ✅ Both are plain text (version control friendly)

---

## Next Steps

See `TODO.md` for implementation roadmap.

**Last Updated:** 2026-09-08
