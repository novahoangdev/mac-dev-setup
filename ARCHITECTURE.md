# Architecture decisions

Short record of why the project looks the way it does. Newest decisions win; history is in git.

## ADR-001 — Document the real stack, not an idealised one

**Decision:** The guide, Brewfile and verify script describe only tools that are actually used day to day: Claude Code, Codex, Gemini CLI, Amp, omp, OmniRoute, Orca, Ghostty, zellij, nvm, Docker Desktop, oh-my-zsh + Powerlevel10k.

**Why:** Earlier versions (AI-generated) recommended Cursor, Zed, aider, ollama, mise, Starship and OrbStack, none of which were in use, so the guide could not be trusted to rebuild the machine.

**Consequence:** Alternatives are not listed. When the daily stack changes, update the Brewfile, `scripts/verify-setup.sh` and `index.html` together.

## ADR-002 — One Brewfile

**Decision:** A single `Brewfile`, grouped by section, with an optional mobile/native block commented out. Replaces `Brewfile.minimal`, `Brewfile.ai` and `Brewfile.apps`.

**Why:** The setup targets one person's machines; layers added maintenance without a real user. `brew bundle check --file=Brewfile` covers verification.

## ADR-003 — Claude Code via native installer, everything else via Homebrew

**Decision:** `curl -fsSL https://claude.ai/install.sh | bash` for Claude Code; Homebrew for the rest. Third-party taps use the full `user/tap/name` form (`stablyai/orca/orca`, `can1357/tap/omp`, `ampcode/tap/ampcode`, `rjyo/moshi/moshi-hook`).

**Why:** The native installer auto-updates. The bare `orca` cask in Homebrew is an unrelated plotly tool, so the tap prefix is required.

## ADR-004 — nvm stays; Node is put on PATH without loading nvm

**Decision:** Keep nvm (default alias 26). `.zshrc` prepends the default Node's `bin` to PATH and lazy-loads the `nvm` function.

**Why:** Fast shell start, and scripts/agents that call `node`, `npx` or `omniroute` work without an interactive `nvm use`.

## ADR-005 — Secrets live only in `~/.zsh_secrets`

**Decision:** API keys (OmniRoute, providers, BrowserStack…) go in `~/.zsh_secrets` (chmod 600), sourced by `.zshrc`. The guide never shows real values.

## ADR-006 — Static single-page guide with prebuilt CSS

**Decision:** `index.html` is plain HTML + a small inline script. Tailwind is compiled once into `assets/styles.css` (`bash scripts/build-css.sh`, via `npx`, no `package.json`); icons are inline SVG.

**Why:** Opens offline with `open index.html`, no CDN or server. Replaces the Tailwind Play CDN + unpinned lucide + Express preview server from Google AI Studio.

**Consequence:** After adding new Tailwind classes to `index.html`, rerun the build and commit `assets/styles.css`.

## ADR-007 — Bilingual, English by default

**Decision:** The guide renders both languages as `<span lang="en">` / `<span lang="vi">` pairs toggled by CSS; scripts print English unless `--vi` is passed; README lists English first.

**Why:** The pair approach keeps inline markup (code, links) intact, which the old `textContent` swap destroyed. One script per job instead of `.en.sh` / `.vi.sh` copies.

## ADR-008 — macOS settings via `defaults` export/apply

**Decision:** `scripts/export-macos-settings.sh` reads a fixed list of `defaults` keys (read-only) and writes `backups/apply-my-settings.sh`. Arrays/dicts are skipped.

**Consequence:** `defaults` keys can change between macOS versions; re-export on the newest Mac before migrating.

## ADR-009 — Firebase Hosting with an allowlist build

**Decision:** Host the guide on Firebase Hosting (project `setup-dev-mac`). `scripts/build-site.sh` (predeploy hook) copies only `index.html` and `assets/` into `dist/`, which is the Hosting `public` dir. GitHub Actions deploy `main` to live and each PR to a 7-day preview channel.

**Why:** A first attempt published the repo root with an ignore list; `**/.*` did not exclude files inside `.git/`, so repo history was briefly downloadable from a preview URL. An allowlist cannot leak new files by accident.

**Consequence:** If the site ever needs another file, add it to `scripts/build-site.sh` explicitly.
