if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases
alias ls='ls --color=auto'
export TIME_STYLE=long-iso # makes YYYY-MM-DD in the ls output
export BLOCK_SIZE="'1" # makes 1,000,000 for big sizes

alias grep='grep --color=auto'
alias df='df -H'
alias fig='find . | grep'
alias reload="source ~/.zshrc"
alias netest="ping 8.8.8.8"
alias simple="python2 -m SimpleHTTPServer"
alias slytherin='mosh slytherin -- tmux attach -d || tmux new'
beammeupscotty() {
    /Users/alex/Projects/sshuttle/src/sshuttle -r $1 0.0.0.0/0 -vv
}
get_youtube_mp3() {
    youtube-dl --extract-audio --audio-format mp3 $1
}
alias -g lastm='*(om[1])'

# Python
if command -v ipython > /dev/null; then
    alias python="ipython"
fi
if command -v ipython3 > /dev/null; then
    alias python3="ipython3"
fi
export PYTHONSTARTUP=$HOME/.pythonrc

# Suffix aliases
alias -s log=less
alias -s html=open

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias vimlast="vim -c \"normal '0\""

# Shorthands
alias e="exit"
alias h='history -fd -500'
alias hgrep='history -fd 0 | grep'

# Analyze history data
analyze_history(){
    cut -f2 -d";" ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30
}
analyze_commands(){
    cut -f2 -d";" ~/.zsh_history | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -n 30
}

# Exports
export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export PATH=$PATH:$HOME/dotfiles/scripts
export TERM='xterm-256color'

# Remove annoying messages
unsetopt correctall

# FASD for faster switching between directories
eval "$(fasd --init auto)"
alias v='f -e vim'

# alt-left and alt-right for switching words in terminal
# taken from https://github.com/solnic/dotfiles/blob/master/home/zsh/key-bindings.zsh
bindkey -e

bindkey '^H' delete-word # iterm
bindkey '^[[3~' delete-char # tmux

bindkey '^[[1;9D' backward-word # iterm
bindkey '^[^[[D' backward-word # tmux os x
bindkey '^[[1;3D' backward-word # tmux ubuntu

bindkey '^[[1;9C' forward-word # iterm
bindkey '^[^[[C' forward-word # tmux os x
bindkey '^[[1;3C' forward-word # tmux ubuntu

# History configurations
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY
# share history between sessions
setopt SHARE_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY
# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
# allow # in a comment
setopt interactivecomments

# Source awscli completion
[ -f /usr/local/share/zsh/site-functions/_aws ] && source /usr/local/share/zsh/site-functions/_aws

# Do a custom prompt stolen from steeeef theme
zstyle ':prezto:module:prompt' theme 'off'
setopt prompt_subst

turquoise="%F{cyan}"
orange="%F{yellow}"
purple="%F{magenta}"
limegreen="%F{green}"
PR_RST="%f"

PROMPT=$'
%{$purple%}%n${PR_RST} at %{$orange%}%m${PR_RST} in %{$limegreen%}%~${PR_RST} %{$turquoise%}${PR_RST}
$ '

# Source configuration for local machine if it exists
[ -f ~/.zshrclocal ] && source ~/.zshrclocal

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
