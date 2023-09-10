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

[ -f ~/.fzf.zsh ] && source "$HOME/.fzf.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
