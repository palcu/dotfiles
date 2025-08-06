export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH=$PATH:$HOME/dotfiles/scripts
export TERM='xterm-256color'

# Remove annoying ZSH messages
unsetopt correctall

# allow # in a comment
setopt interactivecomments

# Directory navigation improvements
setopt AUTO_CD              # Type directory name to cd into it
setopt AUTO_PUSHD          # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS   # No duplicates in directory stack
setopt CDABLE_VARS         # cd to variable values

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

# Initialize completion system
autoload -Uz compinit && compinit

# Completion system customization
zstyle ':completion:*' menu select                        # Interactive menu selection
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'      # Case insensitive matching
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}    # Colored completion list
zstyle ':completion:*:descriptions' format ''             # Hide group descriptions
zstyle ':completion:*:warnings' format 'No matches for: %d' # Warning for no matches
zstyle ':completion:*' group-name ''                      # Group results by type