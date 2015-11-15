# basics
zmodload zsh/stat zsh/terminfo
autoload -Uz zargs zmv
setopt AUTO_CD
setopt EXTENDED_GLOB
unsetopt CLOBBER
unsetopt HUP

# editor
bindkey -e
stty -ixoff -ixon
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "\ee" edit-command-line
bindkey "$terminfo[khome]" beginning-of-line
bindkey "$terminfo[kend]" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char

# history
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# history search
source ~/.zfuncs/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "\e[A" history-substring-search-up
bindkey "\e[B" history-substring-search-down

# colors
autoload -Uz colors
colors
eval `dircolors ~/.dir_colors`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# completions
zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# theme
autoload -Uz promptinit
fpath=($HOME/.zfuncs $fpath)
promptinit
prompt hackup

# aliases
alias cls='printf "\033c"'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='l -A'
alias rm='rm -i'
alias svim='sudo vim -u $HOME/.vimrc'
alias svi='svim'
alias tmux='tmux -2'
alias ssh-dumb='export TERM=xterm; ssh'
alias venv='source env/bin/activate'
alias gopath='export GOPATH=`pwd`; path=("$GOPATH/bin" "$path[@]")'
alias pm='sudo pacman'
alias pmi='sudo pacman -S'
alias pmu='sudo pacman -Syu'
alias pmr='sudo pacman -Rs'
alias pms='pacman -Ss'
alias pmo='pacman -Qo'
alias sctl='sudo systemctl'
alias jrnl='sudo journalctl'

# local settings
if [[ -e ~/.zshrc.local ]]; then
	source ~/.zshrc.local
fi
