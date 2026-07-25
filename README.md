# dotfiles

Config for my personal Ubuntu server (`palcu.ro`). One flat set of files,
one install script.

## Layout

- `home/` — dotfiles symlinked into `$HOME` (`.zshrc`, `.gitconfig`, `.tmux.conf`, `.gitignore`, `.config/nvim/`)
- `install.sh` — installs apt packages, shims Debian-renamed binaries, creates the symlinks, sets up tmux plugins

## Setup

```bash
git clone https://github.com/palcu/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
chsh -s "$(command -v zsh)"
```

Machine-specific tweaks go in `~/.zshrc.local` and `~/.gitconfiglocal`
(both untracked). Re-running `install.sh` is safe.

## History

Before 2026 this repo was an Ansible-driven provisioner for a Mac and this
server, with fish and zsh configs — see the git history if you need any of it.
