export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH=$PATH:$HOME/dotfiles/scripts
export TERM='xterm-256color'

# Remove annoying ZSH messages and beeping
unsetopt correctall
unsetopt BEEP            # No bell on error
unsetopt LIST_BEEP      # No bell on ambiguous completion
unsetopt HIST_BEEP      # No bell on history errors

# allow # in a comment
setopt interactivecomments

# Directory navigation improvements
setopt AUTO_CD              # Type directory name to cd into it
setopt AUTO_PUSHD          # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS   # No duplicates in directory stack
setopt CDABLE_VARS         # cd to variable values

# make the autosuggestions work with solarized
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=value'

# Use completion-based suggestions instead of history
ZSH_AUTOSUGGEST_STRATEGY=(completion)
# Only show suggestions when buffer has at least 2 characters
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="?(#c0,1)"  # Ignore patterns with 0-1 characters

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

# Completion system customization
zstyle ':completion:*' menu select                        # Interactive menu selection
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'      # Case insensitive matching
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}    # Colored completion list
zstyle ':completion:*:descriptions' format ''             # Hide group descriptions
zstyle ':completion:*:warnings' format 'No matches for: %d' # Warning for no matches
zstyle ':completion:*' group-name ''                      # Group results by type