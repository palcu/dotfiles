# Replace core utils with modern alternatives (matching Fish config)
alias cat='bat'
alias diff='delta'
alias find='fd'
alias ls='eza'

# Make core utils better
export TIME_STYLE=long-iso # makes YYYY-MM-DD in the ls output
export BLOCK_SIZE="'1" # makes 1,000,000 for big sizes

# Common commands
alias reload='source ~/.zshrc'
alias netest='ping 8.8.8.8'
alias simple='python2 -m SimpleHTTPServer'
alias hgrep='history -fd 0 | grep'

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# Shorthands
alias e="exit"
alias h='history -fd -500'

# Analyze history data
analyze_history(){
    cut -f2 -d";" ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30
}
analyze_commands(){
    cut -f2 -d";" ~/.zsh_history | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -n 30
}

# Suffix aliases
alias -s log=less
alias -s html=open
