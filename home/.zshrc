if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source "$HOME/dotfiles/zshrc/aliases.zsh"
source "$HOME/dotfiles/zshrc/python.zsh"
# Exports and setopts
source "$HOME/dotfiles/zshrc/configs.zsh"
source "$HOME/dotfiles/zshrc/key-bindings.zsh"
source "$HOME/dotfiles/zshrc/prompt.zsh"

# Source configuration for local machine if it exists
[ -f ~/.zshrclocal ] && source "$HOME/.zshrclocal"

# FASD for faster switching between directories
eval "$(fasd --init auto)"

[ -f ~/.fzf.zsh ] && source "$HOME/.fzf.zsh"
