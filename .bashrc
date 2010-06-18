# ----------------------------------------------------------------------------
# file:     ~/.bashrc
# author:   Fl4t
# modified: June 2010
# ----------------------------------------------------------------------------

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
PATH=$PATH:/home/USERNAME/scripts

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

#colorized pacman output with pacs alias:
alias pacs="pacsearch"
pacsearch() {
   echo -e "$(pacman -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}

# ----------------------------------------------------------------------------
#aliases
# ----------------------------------------------------------------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias unmount='umount'
alias pakman='pacman'
alias ll="ls -alh"
alias exit="clear; exit"
alias q="exit"
alias x="startx"
alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep "
alias pacup="sudo pacman -Syu"
alias pac="sudo pacman -S"
alias pacrm="sudo pacman -Rs"
alias reboot="sudo reboot"
alias halt="sudo halt"
