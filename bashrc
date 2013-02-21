[ -z "$PS1" ] && return

# system settings
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# terminal title
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# turn on 256 colors if not inside screen
[[ "$TERM" == screen* ]] || export TERM='xterm-256color'

# window size
shopt -s checkwinsize

# history control
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

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
PS1="${BLUE}\u${GREEN}@${BLUE}\h${BBLUE}: ${BGREEN}\w ${BRED}\\$ ${NORMAL}"

### aliases
# ssh
alias irc="ssh -t irc screen -drUAS irc"
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
alias waf='$(pwd)/waf'
alias virt='source env/bin/activate'
alias vimupdate='vim +BundleInstall! +qall'

### load site-specific options
[[ -f .bashrc.local ]] && source .bashrc.local

