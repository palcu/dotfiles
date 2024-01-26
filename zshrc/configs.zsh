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