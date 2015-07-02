if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases
alias l="ls -F"
alias ll="ls -AGlFt"
alias grep='grep --color=auto'
alias df='df -H'
alias fig='find . | grep'
alias reload="source ~/.zshrc"
alias netest="ping 8.8.8.8"
alias simple="python -m SimpleHTTPServer"
alias beammeupscotty="/Users/alex/Projects/sshuttle/src/sshuttle -r root@192.241.234.247 0.0.0.0/0 -vv"

# Suffix aliases
alias -s log=less
alias -s html=open

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias vimlast="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"
alias bashar="open ~/Dropbox/bashar.pdf"
alias objectives="vim /Users/alexp/Dropbox/Draft/obiective.txt"

# Shorthands
alias e="exit"
alias go='gnome-open'
alias h='history'
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
# export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH # better coreutils
export PYTHONSTARTUP="$HOME/.pythonrc"

# Remove annoying messages
unsetopt correctall

# FASD for faster switching between directories
eval "$(fasd --init auto)"
alias v='f -e vim'

# alt-left and alt-right for switching words in terminal
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

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

source $HOME/.ubervu.sh
if [[ `uname` == 'Darwin' ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

