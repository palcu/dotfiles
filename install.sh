#!/usr/bin/env bash
# Provision slytherin: apt packages + symlinks. Idempotent — safe to re-run.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing packages"
sudo apt-get update -qq
sudo apt-get install -y \
  zsh zsh-autosuggestions zsh-syntax-highlighting \
  git git-delta gh tmux neovim jq ripgrep bat fd-find eza \
  curl wget htop nmap

echo "==> Shimming Debian-renamed binaries (batcat->bat, fdfind->fd)"
mkdir -p "$HOME/.local/bin"
ln -sfn /usr/bin/batcat "$HOME/.local/bin/bat"
ln -sfn /usr/bin/fdfind "$HOME/.local/bin/fd"

echo "==> Symlinking dotfiles"
link() {
  mkdir -p "$(dirname "$2")"
  # A real file/dir at the destination would make ln nest the link inside it.
  if [[ -e "$2" && ! -L "$2" ]]; then
    mv "$2" "$2.bak.$(date +%s)"
    echo "  backed up existing $2"
  fi
  ln -sfn "$1" "$2"
  echo "  $2 -> $1"
}
link "$DOTFILES/home/.zshrc"      "$HOME/.zshrc"
link "$DOTFILES/home/.gitconfig"  "$HOME/.gitconfig"
link "$DOTFILES/home/.gitignore"  "$HOME/.gitignore"
link "$DOTFILES/home/.tmux.conf"  "$HOME/.tmux.conf"
link "$DOTFILES/home/.config/nvim" "$HOME/.config/nvim"

echo "==> tmux plugin manager"
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
"$HOME/.tmux/plugins/tpm/bin/install_plugins" || true

echo "==> Done. Set the login shell with: chsh -s $(command -v zsh)"
