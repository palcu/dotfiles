source "$HOME/dotfiles/zshrc/aliases.zsh"
source "$HOME/dotfiles/zshrc/configs.zsh"
source "$HOME/dotfiles/zshrc/key-bindings.zsh"
source "$HOME/dotfiles/zshrc/prompt.zsh"
source "$HOME/dotfiles/zshrc/zinit.zsh"

# Source configuration for local machine if it exists
[ -f ~/.zshrclocal ] && source "$HOME/.zshrclocal"



source /Users/palcu/code/anthropic/config/local/zsh/zshrc  # added by conda.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
