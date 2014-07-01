# ZSH Settings
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
plugins=(git nyan rails command-not-found pip hub django brew cake coffee fabric fasd osx npm cp supervisor z github vagrant scala sbt python fabric osx)
source $ZSH/oh-my-zsh.sh

# Prompt settings, because on Vagrant, with symlinked directories, the themes hang up
if [[ `uname` == 'Linux' ]]; then
  PROMPT='%{$fg_bold[magenta]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%}%# '
  RPROMPT=""
fi

# Aliases
alias l="ls -F"
alias ll="ls -AGlFt"
alias grep='grep --color=auto'
alias df='df -H'
alias reload="source ~/.zshrc"
alias netest="ping 8.8.8.8"
alias simple="python -m SimpleHTTPServer"

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias vimlast="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"

# Shorthands
alias e="exit"
alias py="python"
alias go='gnome-open'
alias h='history'

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
export PATH="$PATH:$HOME/.rvm/bin" # RVM path
export HISTSIZE=1000000

# Remove annoying messages
unsetopt correctall

# FASD for faster switching between directories
eval "$(fasd --init auto)"

# alt-left and alt-right for switching words in terminal
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

source $HOME/.ubervu.sh
if [[ `uname` == 'Darwin' ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
