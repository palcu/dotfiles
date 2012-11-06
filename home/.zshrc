# RVM
alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt

# Start tmux
if [[ -z "$TMUX" ]]; then
  tmux new-session -d '~/.tmuxrc; zsh' \; attach
fi

# ZSH Settings
ZSH=$HOME/.oh-my-zsh
plugins=(git nyan rails bundler command-not-found pip)
source $ZSH/oh-my-zsh.sh

# Prompt
PROMPT='%{$fg_bold[magenta]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%}%# '
RPROMPT='%{$fg_bold[green]%}$(git_prompt_info) %{$reset_color%}!%!'
ZSH_THEME_GIT_PROMPT_PREFIX="<%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}✗%{$fg[green]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}>"

# Aliases
alias ls='ls --color=auto'
alias l="ls -F"
alias ll="ls -AGlFt"
alias grep='grep --color=auto'
alias df='df -H'
alias kernel="watch 'dmesg|tail'"
alias update="sudo apt-get update; sudo apt-get upgrade"
alias install="sudo apt-get install"
alias ports='netstat -tulanp'
alias header='curl -I'
alias remove="sudo apt-get remove"
alias off="sudo shutdown -h now"
alias reload="source ~/.zshrc"
alias quote="shuf -n 1 ~/.quotes.txt"
alias netest="ping 8.8.8.8"

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias lastvim="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"

# Shorthands
alias v="vim"
alias e="exit"
alias py="python"
alias go='gnome-open'
alias h='history'
alias j='jobs -l'

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
export PYTHONSTARTUP=/home/alex/.pythonrc.py
export EDITOR="vim"
export PAGER="most"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export PATH=${PATH}:~/Tools/android-sdk-linux/platform-tools:~/Tools/android-sdk-linux/tools:~/Tools/google_appengine
export HISTSIZE=1000000

# Remove annoying messages
unsetopt correctall

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
