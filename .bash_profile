####
# Colors etc
####

export PS1="\[\033[0m\]\[\033[1;35m\]\u\[\033[0m\]@\[\033[1;34m\]\h:\[\033[1;35m\]\W\[\033[0m\]$ "

export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
export LSCOLORS=ExFxCxFxBxegedabagaced

####
# PATH stuff
####

export PATH=$PATH:/Users/camille/bin
export PATH=$PATH:/Users/camille/bin/node-v8.11.2-darwin-x64/bin/
export PATH=$PATH:/Applications/Julia-0.3.0.app/Contents/Resources/julia/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"



#export PATH=$HOME/bin/TransDecoder-2.0.1:$PATH
export PATH=$HOME/w/TransDecoder-3.0.1:$PATH
export PATH=/usr/local/opt/ccache/libexec:$PATH
export PATH="$HOME/miniconda/bin:$PATH"

####
# Aliases
####

alias pdf='open -a Preview'
alias h='history'

alias ..='cd ..'

#alias du='du -kh'       # Makes a more readable output.
#alias df='df -kh'


alias ll="ls -l --group-directories-first"
alias ls='ls -GFh'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTTIMEFORMAT="%H:%M > "
export HISTIGNORE="&:bg:fg:ll:h"
#export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts ...

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -oh --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias gitl='git pull'
alias gitc='git commit'
alias gita='git add'
alias gits='git push'
alias gitb='git branch'
alias gitf='git fetch'
alias gitr='git remote'
alias gitm='git merge'

####
# Custom functions and commands
####

alias clear_cache="sudo su -c 'echo 3 > /proc/sys/vm/drop_caches'"
COLS=`tput cols`
alias center="sed  -e :a -e 's/^.\{1,'"$(( $COLS - 2 ))"'\}$/ & /;ta'"
alias div="tput bold; printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =; tput sgr 0"

####
# Welcome Screen
####

div
echo
echo
tput setaf 2
figlet -c -w `tput cols` -f fraktur $HOSTNAME
tput sgr 0
echo
tput bold; center.sh "welcome, $USER"
echo
center.sh "`date`"
echo
center.sh "`uname -srm`"
echo
center.sh "`hostinfo | grep active`"
center.sh "`hostinfo | grep memory`"
echo "`df -h | grep /dev/ | awk '{print $3,"of",$2,"("$5") used on /"}'`" | center
echo
div
echo
echo "`python -m this`" | center
echo
div
gshuf -n1 ~/.futurama | center
div
echo

if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # Makes our day a bit more fun.... :-)
fi

####
# Misc.
####

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

brewPkg() {
  pkg=$1
  shift
  (
    brew install ${pkg} $*  2>&1 |
        tee $HOME/Library/Logs/Homebrew/$USER/${pkg}-$(date +"%F_%H%M").txt
  )
}

brewSrcPkg() {
  pkg=$1
  shift
  (
    brew install --build-from-source  ${pkg} $*  2>&1 |
        tee $HOME/Library/Logs/Homebrew/$USER/${pkg}-$(date +"%F_%H%M").txt
  )
}

brewSrcPkgWgcc() {
  pkg=$1
  shift
  (
    export CC=gcc-6
    export CXX=g++-6
    export HOMEBREW_CC=gcc-6
    export HOMEBREW_CXX=g++-6
    brew install --build-from-source  ${pkg} $*  2>&1 |
        tee $HOME/Library/Logs/Homebrew/$USER/${pkg}-$(date +"%F_%H%M").txt
  )
}

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
