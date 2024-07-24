#!/usr/bin/env bash



export ZSH="$HOME/.oh-my-zsh"




export TMOUT=0
export LD_LIBRARY_PATH=./lib/:$TIBRV_HOME/lib/:/bar/deps/thirdparty/google-test-framework/Linux/x86_64/2.6/gcc411_libc25/lib/:$LD_LIBRARY_PATH

#Long Version of Putty Title
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
# PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
# Simplest verion of PS1
#export PS1="`uname -n`> "
#export PS1='\u@\h> '

# Simpler Version to see dir details on 1 line
#export PS1='\u@\h\ : \w \n>'

# Most Complicated version
#PS1='\e[1;31;40m\u \e[1;31;40mon \h \e[0;0m\e[1;31m[\w]\n > \e[0;0m'
#PS1='\e[1;31;34m\u\e[1;31;34m@\h: \e[0;0m\e[1;31m[\w]\n>\e[0;0m'
# PS1='\e[1;31;34m\e[1;31;36m\h: \e[0;0m\e[1;35m[\w]\e[0;0m\n\u > '


alias ls='ls -G'
alias lc='colorls -lA --sd'

#######################################################################################################################################


#######################################################################################################################################

export PATH=$JAVA_HOME/bin/:$PATH
export PATH=./:$PATH


source ~/.hhighlight.sh
if test -z "$SOURCED_HOME_BASHRC" ; then
   readonly SOURCED_HOME_BASHRC=true
fi

# less stuff
export LESS='-Ri'
export LESSOPEN='|~/.lessfilter %s'



# =====================================================================================================================================

# aliai
alias fck='thefuck'
alias ctl='sudo systemctl'
alias vsta='sudo systemctl start eon.x11vnc'
alias vsto='sudo systemctl stop eon.x11vnc'
alias vstt='sudo systemctl status eon.x11vnc'
alias spi='sudo apt install -y'
alias sps='sudo apt search'
alias ta='tmux attach || tmux new'
alias wtf='watch -n 0.1 tail -f'
alias tf='tail -f'
alias su='sort -u'
alias k1='kil %1'
alias fk1='fkil %1'
alias k2='kil %2'
alias fk2='fkil %2'
alias dirs='ls -d */'
alias k15='kill -15'
alias k9='kill -9'
alias disk='du -sh'
alias lsize='ls -lshrt'
alias llogs='ll *.log'
alias txt='ll *.txt'
alias tars='ls *.tar'
alias zips='ls *.zip'
alias gzs='ls *.gz'
alias rpwd='pwd -P'
alias mybash='pwd && vim ~/.bashrc && . ~/.bashrc'
alias b='mybash'
alias z='pwd && vim ~/.zshrc && . ~/.zshrc'
alias bscript='vim ~/.bash_scripts && . ~/.bashrc'
alias myvim='pwd && vim ~/.vimrc'


# Directory traversal
alias 1cd="cd ../ && pwd"
alias .1="cd ../ && pwd"
alias 2cd="cd ../../ && pwd"
alias .2="cd ../../ && pwd"
alias 3cd="cd ../../../ && pwd"
alias .3="cd ../../../ && pwd"
alias 4cd="cd ../../../../ && pwd"
alias .4="cd ../../../../ && pwd"
alias 5cd="cd ../../../../../ && pwd"
alias .5="cd ../../../../../ && pwd"
alias 6cd="cd ../../../../../../ && pwd"
alias .6="cd ../../../../../../ && pwd"
alias 7cd="cd ../../../../../../../ && pwd"
alias .7="cd ../../../../../../../ && pwd"


alias edit=kd
alias gt='gnome-terminal'
alias l="ls -F"
alias ll="l -lh"
alias lll='ll -rt | tail'
alias md='mkdir -p'
alias whos='who | sort | uniq -cw 10'


# =====================================================================================================================================
# fix bug in gnome-terminal where ctrl-S for readline i-search does not work
# because ctrl-S is used by gnome-termial for some flow control nonesense
# e.g see http://www.mail-archive.com/debian-user@lists.debian.org/msg63190.html
# or https://bugs.launchpad.net/ubuntu/+source/bash/+bug/48880
stty stop ''
stty start ''

# allow unlimited core files
ulimit -c unlimited

# command history
export HISTFILESIZE=999999
export HISTCONTROL=ignoredups


#export LD_LIBRARY_PATH=./lib/:$TIBRV_HOME/lib/:/var/userspace/acanfora/gtest-1.6.0/:/usr/local/lib:/var/userspace/acanfora/gtest-1.6.0/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./lib/:$TIBRV_HOME/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64:$LD_LIBRARY_PATH



# Creates symbolic links
# Note: Can use multiple values in here like "link config osederiv asxtrade om"





#######################################################################################################################################

# Add folders to $PATH
# Ensures that $PATH always has only one instance of folder names in it
pathadd()
{
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

pathadd ~/.oh-my-zsh/
pathadd /usr/local/mysql/bin
pathadd /opt/local/bin/
pathadd $EC2_HOME/bin
pathadd .

wp() {
  which python
}
function cd() {
  builtin cd "$@"
  sp
}

sp() {
  [ -d ".env" ] && source .env/bin/activate
  [ -d "ve" ] && source ve/bin/activate
  [ -d "venv" ] && source venv/bin/activate
}

# git aliases
alias gs='git status'
alias gpu='git push'
alias gpl='git pull'


pef() {
  ps -ef | egrep "$*" | egrep -v "grep \-\-color" | egrep "$*"
}

alias nf="find ./ -iname "
alias v1='vim /tmp/1'
alias v2='vim /tmp/2'


export PYTHONPATH="${PYTHONPATH}:./"


# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# source /opt/homebrew/lib/python3.11/site-packages/powerline/bindings/bash/powerline.sh


llg(){
  ITEMS=${1:-5}
  ls -lrth logs/ | tail -$ITEMS
}


nfi() {
  find . -iname "*$**"
}

pc() {
    local user="jeremy"
    local server=""
    
    case $1 in
        c*)
            server="casper"
            ;;
        n*)
            server="napoleon"
            ;;
        h*)
            server="hercules"
            ;;
        p*)
            server="pluto"
            ;;
        r*)
            server="risky"
            ;;
        *)
            echo "Unknown server keyword: $1"
            return 1
            ;;
    esac

    ssh "${user}@${server}"
}


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
