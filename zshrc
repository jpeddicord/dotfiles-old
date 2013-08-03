# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# don't share history
unsetopt SHARE_HISTORY

# aliases
alias cls='printf "\033c"'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='l -A'
alias svim='sudo vim -u $HOME/.vimrc'
alias svi='svim'
alias tmux='tmux -2'
alias virt='source env/bin/activate'
alias irc="ssh -t irc screen -drUAS irc"
