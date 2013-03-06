# .bashrc

# User specific aliases and functions

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

#history append and other options
shopt -s histappend
export HISTFILESIZE=10000
export HISTSIZE=8000
export HISTCONTROL=erasedups
export CDPATH='.:~:~/Dropbox:/usr/local'
#for glances:
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

ulimit -c unlimited

#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias less='less -r'
#alias view='vim -R'
#alias ls='ls -Gp'
#alias lotr='ls -lotrh'

#some colors for ls
export LSCOLORS="cxfxexdxbxegedabagacad"


#if [[ ("$TERM_PROGRAM" == "Apple_Terminal" || "$TERM_PROGRAM" == "iTerm.app") && (-z "$INSIDE_EMACS") ]]; then
    #update_terminal_cwd() {
        ## Identify the directory using a "file:" scheme URL,
        ## including the host name to disambiguate local vs.
        ## remote connections. Percent-escape spaces.
	#local SEARCH=' '
	#local REPLACE='%20'
	#local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	#printf '\e]7;%s\a' "$PWD_URL"
    #}
    #PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
#fi
#export PS1='@\t:\w\$ '
#export PS1='[\W] \$ '
#Prompt help: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
PS11='\[\e[1;31m\]>>> [\w] (\[\e[1;34m\]\D{%a, %d %b}\[\e[0m\] \D{%l:%M:%S %p}\[\e[1;31m\])\[\e[0m\] \[\e[1;32m\]\u@\H (\j)\[\e[0m\] \n\$ '
export PS1='\[\e[1;34m\]\W \[\e[1;35m\](\j)➙ \[\e[0m\]'

export PATH=/usr/local/bin:/usr/local/git/bin:$PATH
export NODE_PATH='/usr/local/lib/node_modules' #for couchapp and other node modules

bind -f ~/.inputrc

export TERM="xterm-256color"


# vim:ts=4:sw=4
