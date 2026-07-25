# CLAUDE.md

This is the dotfiles repo for a single personal Ubuntu server (slytherin,
`palcu.ro`, ssh port 1337). It is a public repo: never add work-related
paths, hostnames, tooling, secrets, or aliases here.

## Structure

- `home/` holds the actual dotfiles; `install.sh` symlinks each into `$HOME`.
- `install.sh` is the whole provisioning story — apt packages, symlinks,
  tmux plugins. Keep it idempotent and readable in one screen.
- Machine-local overrides live in the untracked `~/.zshrc.local` and
  `~/.gitconfiglocal` (included from `.gitconfig`).

## Conventions

- zsh only. Aliases that shadow core utils (`cat`, `ls`, `diff`) must be
  guarded with `(( $+commands[...] ))` so a missing binary can't break the
  command in non-interactive shells.
- Debian renames `bat`->`batcat` and `fd`->`fdfind`; `install.sh` shims them
  back to their upstream names in `~/.local/bin`.
- To apply changes on the server: `git pull` then re-run `./install.sh` if
  files or packages were added.
