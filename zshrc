# basics
zmodload zsh/stat zsh/terminfo
autoload -Uz zargs zmv
setopt AUTO_CD
setopt EXTENDED_GLOB
unsetopt CLOBBER
unsetopt HUP

# vi mode
bindkey -v
bindkey -M vicmd "v" edit-command-line

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
source ~/.zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# colors
autoload -Uz colors
colors
eval `dircolors ~/.dir_colors`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# completions
zmodload zsh/complist
autoload -Uz compinit
compinit
setopt completealiases
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
alias pms='sudo pacman -Ss'
alias sysc='sudo sysctl'
alias jrnl='sudo journalctl'

# local settings
if [[ -e ~/.zshrc.local ]]; then
	source ~/.zshrc.local
fi
