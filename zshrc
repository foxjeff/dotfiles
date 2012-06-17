SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/Dropbox/work/zsh-history

setopt HIST_IGNORE_ALL_DUPS
setopt histfindnodups

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

autoload -U compinit
compinit -C
autoload -U zstyle+
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'
autoload -U colors
colors
#
LS_COLORS="cxfxexdxbxegedabagacad"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
#prompt="%{${fg[green]}%}"'%25<..<%~'"%{$fg[default]%}"'➙  '
#prompt-simple="%~> "
#last 2 segments of path in purple(55) and job# in parens if > 0
prompt="%F{55}"'%2~'"%f"'%1(j.(%j%).)➙  '
alias ls='ls -FCGp'
