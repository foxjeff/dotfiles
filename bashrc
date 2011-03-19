# .bashrc

# User specific aliases and functions

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi
# Get the aliases and functions
#if [ -f ~/.bash_profile ]; then
#	. ~/.bash_profile
#fi

ulimit -c unlimited

alias less='less -r'
alias view='vim -R'
alias ls='ls -Gp'
alias lotr='ls -lotrh'

#export VIM_APP_DIR='/Applications/vim70/'

export LSCOLORS="cxfxexdxbxegedabagacad"
#export PS1='@\t:\w\$ '
export PS1='[\W] \$ '
#PS1='\e]2;\u@\h:\w\a\e[1;31m>>> [\w] (\e[34m\D{%a, %d %b}\e[0m \D{%l:%M:%S %p}\e[1;31m)\e[0m ~\u@\h \n\ek\$ '

export PATH=/usr/local/bin:/usr/local/git/bin:$HOME/bin:$JAVA_HOME/bin:$PATH

bind -f ~/.inputrc

export TERM="xterm" #-256color"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# vim:ts=4:sw=4
