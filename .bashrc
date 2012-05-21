# default is "[\u@\h \W]\$"
export PS1="\[\033[1;34m\]@\h:\w]$\[\033[0m\] "

export GREP_OPTIONS="--color=auto"


alias diff='diff -u'
# view screen list
alias sl='screen -ls'

# attach screen session
alias sx='screen -x'

# svn
alias svndiff='svn diff -x --ignore-eol-style -x -w'
alias svnlog=' svn log -v'

alias l='ls -l'
alias ll='ls -l'
