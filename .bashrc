# ----------------------------------------------------------------------------
# file:     ~/.bashrc
# author:   Fl4t
# modified: June 2010
# ----------------------------------------------------------------------------

# Check for an interactive session
[[ -z "$PS1" ]] && return

#default editor
export EDITOR="vim"

#colorized ls
alias ls='ls --color=auto'
eval `dircolors -b`

#PS1 personalised
PS1='\[\033[01;32m\]\u\[\033[01;31m\]@\[\033[01;36m\]\h \[\033[01;33m\]\W \[\033[1;30m\]>\[\033[0;32m\]>\[\033[1;32m\]>\[\033[m\] \[\033[00m\]'

#indent on sudo
complete -cf sudo

#Now when you open a new shell window, you can simply type the name of your scripts.
PATH=$PATH:/home/fl4t/scripts

#color grep
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

#faster completion
set show-all-if-ambiguous on

#extract utility
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

# history options
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*"
export HISTFILESIZE=2000
export HISTCONTROL="ignoreboth"
export HISTSIZE=500

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

# ----------------------------------------------------------------------------
#aliases
# ----------------------------------------------------------------------------

alias pacs="pacsearch"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias unmount='umount'
alias pakman='pacman'
alias ll="ls -alh"
alias exit="clear; exit"
alias q="exit"
alias x="startx"
alias pacs="pacman -Sl | cut -d' ' -f2 | grep"
alias pacup="sudo pacman -Syu"
alias pac="sudo pacman -S"
alias pacrm="sudo pacman -Rs"
alias reboot="sudo reboot"
alias halt="sudo halt"
