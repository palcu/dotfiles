if status is-interactive
    # Replace core utils
    alias cat='bat'
    alias diff='delta'
    alias find='fd'
    alias ls='eza'

    # Make core utils better
    export TIME_STYLE=long-iso # makes YYYY-MM-DD in the ls output
    export BLOCK_SIZE="'1" # makes 1,000,000 for big sizes

    # Common commands
    alias reload='source ~/.config/fish/config.fish'
    alias netest='ping 8.8.8.8'

    # Shorthands
    alias e="exit"
    alias h='history -t -500'
end

# Load local machine config
if test -f ~/.config/fish/config_local.fish
    source ~/.config/fish/config_local.fish
end
