if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Aliases
alias l="ls -F"
alias ll="ls -AGlFth"
alias grep='grep --color=auto'
alias df='df -H'
alias fig='find . | grep'
alias reload="source ~/.zshrc"
alias netest="ping 8.8.8.8"
alias simple="python -m SimpleHTTPServer"
alias slytherin='mosh slytherin -- tmux attach || tmux new'
beammeupscotty() {
    /Users/alex/Projects/sshuttle/src/sshuttle -r root@$1 0.0.0.0/0 -vv
}
alias -g lastm='*(om[1])'

# Suffix aliases
alias -s log=less
alias -s html=open

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias vimlast="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"
alias bashar="open ~/Dropbox/bashar.pdf"
alias devdocs="open http://devdocs.io"

# Shorthands
alias e="exit"
alias go='gnome-open'
alias h='history -fd -100'
alias hgrep='history -fd 0 | grep'
alias sr='ssh -l root'

# cd & ls
alias lc="cl"
cl() {
   if [ -d "$1" ]; then
      cd "$1"
      l
   fi
}

# mkdir & ls
alias cm="mc"
mc() {
    mkdir -p "$*" && cd "$*" && pwd
}

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
export PATH=/usr/local/bin:$PATH # Brew path
export PATH=/usr/local/sbin:$PATH # Brew second path
export PATH=$PATH:$HOME/dotfiles/scripts
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export PYTHONSTARTUP="$HOME/.pythonrc"
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
setopt SHARE_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

if [[ `uname` == 'Darwin' ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi
