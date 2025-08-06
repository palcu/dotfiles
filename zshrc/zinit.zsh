### Zinit Plugin Manager ###

# Install Zinit if not present
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Z - Jump to frequently used directories
zinit light agkozak/zsh-z

# iTerm2 Shell Integration
zinit snippet "https://iterm2.com/shell_integration/zsh"

# FZF - Fuzzy Finder (better Ctrl+R and more)
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

# FZF shell integration for key bindings and completion
zinit snippet "https://github.com/junegunn/fzf/raw/master/shell/key-bindings.zsh"
zinit snippet "https://github.com/junegunn/fzf/raw/master/shell/completion.zsh"

# Load completions
autoload -Uz compinit && compinit

# Zinit completions compilation
zinit cdreplay -q