
source "$HOME/dotfiles/zshrc/aliases.zsh"
source "$HOME/dotfiles/zshrc/configs.zsh"
source "$HOME/dotfiles/zshrc/key-bindings.zsh"
source "$HOME/dotfiles/zshrc/prompt.zsh"
source "$HOME/dotfiles/zshrc/zinit.zsh"

# Source configuration for local machine if it exists
[ -f ~/.zshrclocal ] && source "$HOME/.zshrclocal"

# Replay deferred completions after compinit is loaded
zinit cdreplay -q 2>/dev/null

