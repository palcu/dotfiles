# zsh config for slytherin (personal Ubuntu server).

# --- Environment ---
export EDITOR="nvim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH="$HOME/.local/bin:$PATH"

# --- Options ---
unsetopt correctall BEEP LIST_BEEP HIST_BEEP
setopt interactivecomments        # allow # comments in interactive shells
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS CDABLE_VARS
setopt prompt_subst

# --- History ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS

# --- Completion ---
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format ''
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# --- Modern core-util replacements (only when installed) ---
export TIME_STYLE=long-iso     # YYYY-MM-DD in ls output
export BLOCK_SIZE="'1"         # 1,000,000 for big sizes
(( $+commands[eza] ))    && alias ls='eza'
(( $+commands[bat] ))    && alias cat='bat'
(( $+commands[delta] ))  && alias diff='delta'
(( $+commands[nvim] ))   && { alias vim='nvim'; alias vi='nvim'; }

# --- Aliases ---
alias reload='source ~/.zshrc'
alias netest='ping 8.8.8.8'
alias simple='python3 -m http.server'
alias hgrep='history -fd 0 | grep'
alias e='exit'
alias h='history -fd -500'
alias c='claude'
alias cr='claude --resume'
alias -s log=less

analyze_history() {
  cut -f2 -d';' "$HISTFILE" | sort | uniq -c | sort -nr | head -n 30
}
analyze_commands() {
  cut -f2 -d';' "$HISTFILE" | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -n 30
}

# --- Key bindings ---
bindkey -e
bindkey '^H'      delete-word     # iterm
bindkey '^[[3~'   delete-char     # tmux
bindkey '^[[1;9D' backward-word   # iterm
bindkey '^[^[[D'  backward-word   # tmux os x
bindkey '^[[1;3D' backward-word   # tmux ubuntu
bindkey '^[[1;9C' forward-word    # iterm
bindkey '^[^[[C'  forward-word    # tmux os x
bindkey '^[[1;3C' forward-word    # tmux ubuntu

# --- Prompt: user at host in path ---
PROMPT=$'\n%F{magenta}%n%f at %F{yellow}%m%f in %F{green}%~%f\n$ '

# --- Plugins (apt: zsh-autosuggestions, zsh-syntax-highlighting) ---
_p=/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $_p ]] && { source $_p; ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'; }
_p=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh   # must be last
[[ -f $_p ]] && source $_p
unset _p

# --- Machine-local overrides ---
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
