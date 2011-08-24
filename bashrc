[ -z "$PS1" ] && return

# system settings
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# turn on 256 colors if not inside screen
[[ "$TERM" == screen* ]] || export TERM='xterm-256color'

# terminal title
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# window size
shopt -s checkwinsize

# history control
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# colors
export COLORFGBG='default;default'
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'

# prompt
PS1="${BLUE}\u${GREEN}@${BLUE}\h${BBLUE}: ${BGREEN}\w ${BRED}\$ ${NORMAL}"

### aliases
# ssh
alias cc="ssh -p 2328 -L 9090:localhost:9090 codechunk.net"
alias irc="ssh -t -p 2328 jacobirc@codechunk.net screen -drUAS irc"
alias lish="ssh jpeddicord@fremont290.linode.com"
alias phonehome="ssh -D 9090 -p 8022 Peddicord@peddicord.us.to"
alias stdsun="ssh peddicor@stdsun.cse.ohio-state.edu"
alias stdlogin="ssh peddicor@stdlogin.cse.ohio-state.edu"
# ls
alias ls='ls -h --color=auto'
alias l='ls -l'
alias la='ls -A'
alias ll='ls -lA'
# vim
alias svim='sudo vim'
alias svi='svim'
# etc
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias minecraft-forward="ssh -N -p 2328 gamesrv@codechunk.net -R :25565:127.0.0.1:25565"
alias waf='$(pwd)/waf'

### environment
export DEBFULLNAME='Jacob Peddicord'
export DEBEMAIL='jpeddicord@ubuntu.com'
export EDITOR='vim'

