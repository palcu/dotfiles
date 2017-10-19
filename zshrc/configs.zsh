export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export PATH=$PATH:$HOME/dotfiles/scripts
export TERM='xterm-256color'

# Remove annoying ZSH messages
unsetopt correctall


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
