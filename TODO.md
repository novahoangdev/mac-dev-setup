# TODO

Open items only. Decisions and their reasons are in `ARCHITECTURE.md`.

- [ ] Run the full quick start on a clean Mac (or a fresh macOS user account) and fix anything that breaks; first real `brew install` of the `stablyai/orca` and `can1357/tap` taps.
- [ ] Re-export `backups/apply-my-settings.sh` on the newest Mac before each migration.
- [ ] Decide on a LICENSE if the repo goes public.
- [ ] Optional: ship the actual dotfiles (`.zshrc` without secrets, Ghostty, zellij, `.gitconfig`) under `dotfiles/` with a symlink script, instead of only showing snippets in the guide.
- [ ] Optional: CI job running `shellcheck scripts/*.sh` and `bash -n backups/*.sh`.
