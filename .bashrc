export EDITOR="vim"
alias ls='ls --color=auto'

#PS1="\u@\h \w \$ "
PS1='\[\033[01;32m\]\u\[\033[01;31m\]@\[\033[01;36m\]\h \[\033[01;33m\]\W \[\033[1;30m\]>\[\033[0;32m\]>\[\033[1;32m\]>\[\033[m\] \[\033[00m\]'

complete -cf sudo
eval `dircolors -b`
export GREP_COLOR="1;33"
alias grep='grep --color=auto'
set show-all-if-ambiguous on

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

alias ll="ls -lh"
alias la="ls -a"
alias exit="clear; exit"
alias x="startx"

alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep "
alias pacup="sudo pacman -Syu"
alias pac="sudo pacman -S"
alias pacrm="sudo pacman -Rs"
alias reboot="sudo reboot"
alias halt="sudo halt"
