
if [[ $- != *i* ]]; then
    return
fi

if [[ -f ~/.dir_colors ]]; then
    eval `dircolors -b ~/.dir_colors`
else
    eval `dircolors -b /etc/DIR_COLORS`
fi

export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'

alias d="ls --color"
alias dir="ls --color"
alias ls="ls --color=auto"
alias ll="ls --color -l"
alias la="ls --color -la"
alias cls="clear"
alias cd..="cd .."
alias pm="package-manager"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias grep="grep --color --exclude-dir=.svn --exclude-dir=build"
alias egrep="egrep --color"
alias fgrep="fgrep --color"
alias pds="python /usr/lib/python2.7/site-packages/pds/test-pds.py"
alias scp-resume="rsync --compress-level=3 --partial --progress --rsh=ssh"
# alias cmakekde="cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`"
alias update_changelog="svn log --xml --limit 200 > log.xml;mkchangelog log.xml > ChangeLog;rm -f log.xml"
alias ins="sudo python setup.py install"
alias bil="sudo pisi build pspec.xml -d"

export HISTCONTROL=ignoredups
export HISTFILESIZE=8000
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla"
alias h=history

hf(){
  grep "$@" ~/.bash_history
}

myip()
{
    links -dump http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}


# Completion -------------------------------------------------------
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set show-all-if-ambiguous On" # show list automatically, without double tab
bind "set bell-style none" # no bell

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'
cl() { cd $1; ls -la; } 

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
  touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
  command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}  #"
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file 
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

export EDITOR='vim'  #Command line
export GIT_EDITOR='vim'

prompt_func() {
    previous_return_value=$?;
    prompt="\[\033]0;${USER} ${PWD}\007\]\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_NC}\] "
    #prompt="\033]0;${PWD}\007\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_NC}\] "
    #prompt="\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_YELLOW}\]$(git_dirty_flag)\[${COLOR_NC}\] "

    if test $previous_return_value -eq 0
    then
        PS1="${prompt}> "
    else
        PS1="${prompt}\[${COLOR_RED}\]> \[${COLOR_NC}\]"
    fi
}
PROMPT_COMMAND=prompt_func

for sh in /etc/profile.d/*.sh ; do
    if [ -r "$sh" ] ; then
        . "$sh"
    fi
done
unset sh

BLUE="[34;01m"
CYAN="[36;01m"
GREEN="[32;01m"
RED="[31;01m"
OFF="[0m"

# keychain ~/.ssh/id_rsa

echo -e  " ${GREEN}*${OFF} $*Kernel  :" `uname -smr`
echo -ne " ${GREEN}*${OFF} $*Uptime  :"; uptime
echo -ne " ${GREEN}*${OFF} $*Time    : "; date
echo

