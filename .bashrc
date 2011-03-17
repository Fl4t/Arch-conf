# ----------------------------------------------------------------------------
# file:     ~/.bashrc
# author:   fl4t
# modified: July 2010
# ----------------------------------------------------------------------------

# Check for an interactive session
if [ -z "$PS1" ]; then
	return
fi

#Complétion plus intelligente
if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

# lecture colorée de logs
logview()
{
   ccze -A < $1 | less -R
}

# lecture colorée de logs en directfunction logview()
logtail()
{
   tail -f $1 | ccze
}

# editeur par default
export EDITOR="vim"

# colorized ls
eval `dircolors -b`

# PS1 personalised
PS1='\[\033[01;32m\]\u\[\033[01;31m\]@\[\033[01;34m\]\h \[\033[01;33m\]\W \[\033[1;30m\]>\[\033[0;32m\]>\[\033[1;32m\]>\[\033[m\] \[\033[00m\]'

# indent on sudo
complete -cf sudo

# Now when you open a new shell window, you can simply type the name of your scripts.
PATH=$PATH:~/scripts

# color grep
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# faster completion
set show-all-if-ambiguous on

# Support des terminaux redimensionnables
# shopt -s checkwinsize

# {{{ extract utility
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
# }}}

# history options
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*"
export HISTFILESIZE="20000"
export HISTCONTROL="ignoreboth"
export HISTSIZE="5000"

# more for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# disable side-effect of less color
function env() {
  exec /usr/bin/env "$@" | grep -v ^LESS_TERMCAP_
}
