# Path to your oh-my-zsh installation oh-my-zsh specific settings
export ZSH=~/.oh-my-zsh
export TERM=xterm-256color
source $ZSH/oh-my-zsh.sh

# ZSH Customization Settings
ZSH_THEME="powerlevel10k/powerlevel10k"

# fix pasting speed
# ref https://github.com/zsh-users/zsh-autosuggestions/issues/238
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# zsh tmux settings
ZSH_TMUX_AUTOSTART='true'
ZSH_TMUX_AUTOCONNECT='false' # do not autoconnect to existing tmux session, allows a new term new tmux session

DEFAULT_USER="$(whoami)"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    ansible
    aws
    cargo
    git
    history
    kubectl
    minikube
    terraform
    zsh-autosuggestions
    zsh-completions
    zsh-z
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR="codium"
export VISUAL="vim"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#---- CUSTOM ----
#Powerlevel9k/Powerlevel10k settings
# https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config#p9kgt
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.p9kgt
source $HOME/.functions
source $HOME/.aliases

# autoload ----------------------------------------------------------------------
autoload -Uz vcs_info 
autoload -Uz colors && colors
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
autoload -U edit-command-line

# syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

#styles
ZSH_HIGHLIGHT_STYLES[default]=none
# ZSH_HIGHLIGHT_STYLES[function]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=green
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[alias]=fg=green
ZSH_HIGHLIGHT_STYLES[builtin]=fg=green
#path
ZSH_HIGHLIGHT_STYLES[path]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[path_prefix]=fg=cyan
ZSH_HIGHLIGHT_STYLES[path_approx]=fg=cyan
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=240

# patterns
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

#---- Export ----
export GOPATH=~/go 
export PATH=$GOPATH/bin:$PATH
export PYTHON39=~/Library/Python/3.9
export PATH=$PYTHON39/bin:$PATH
export GOROOT=/usr/local/opt/go/libexec
#---- End Export ----

#---- Source ----
[ -f ~/bin/fubectl.source ] && source ~/bin/fubectl.source
source <(kubectl completion zsh)
#---- End Source ----
#---- END CUSTOM ----

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

fpath=($fpath ~/.zsh/completion)

complete -o nospace -C /usr/local/bin/terraform terraform

