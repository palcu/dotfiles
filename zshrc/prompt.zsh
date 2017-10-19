# Do a custom prompt stolen from steeeef theme
zstyle ':prezto:module:prompt' theme 'off'
setopt prompt_subst

turquoise="%F{cyan}"
orange="%F{yellow}"
purple="%F{magenta}"
limegreen="%F{green}"
PR_RST="%f"

PROMPT=$'
%{$purple%}%n${PR_RST} at %{$orange%}%m${PR_RST} in %{$limegreen%}%~${PR_RST} %{$turquoise%}${PR_RST}
$ '
