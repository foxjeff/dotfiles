# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# java
#JAVA_HOME=/usr/java/jdk1.5.0_03
#JAVA_HOME=/mnt/fc4_i386/usr/java/jdk1.5.0_03

# cvs stuff
#EMAIL="Anand Fox <anandfox@arl.amrita.edu>"
#PATH=/usr/local/bin:$HOME/bin:$PATH
export MANPATH=/usr/share/man:/usr/local/share/man:/opt/local/share/man
export INFOPATH=/usr/share/info:/usr/local/share/info:/opt/local/share/info

#export PATH JAVA_HOME
unset USERNAME
#export DOCUMENT_ROOT=/var/www

#bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

#for rbenv
#eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
