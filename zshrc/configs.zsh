export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export PATH=$PATH:$HOME/dotfiles/scripts
export TERM='xterm-256color'

# Remove annoying ZSH messages
unsetopt correctall

# allow # in a comment
setopt interactivecomments

# make the autosuggestions work with solarized
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=value'

# History configuration
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000       # Number of commands to keep in memory
export SAVEHIST=1000000       # Number of commands to save to disk
export HISTFILESIZE=2000000   # Maximum number of lines in history file

# History options for better syncing
setopt EXTENDED_HISTORY       # Save timestamp and duration
setopt INC_APPEND_HISTORY     # Write to history file immediately, not when shell exits
setopt SHARE_HISTORY          # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate