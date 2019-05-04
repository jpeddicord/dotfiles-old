# basics
zmodload zsh/stat zsh/terminfo
autoload -Uz zargs zmv
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt CLOBBER
unsetopt HUP

# WSL gotchas
if grep -qi Microsoft /proc/version 2>/dev/null; then
    unsetopt BG_NICE
fi

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
HISTSIZE=999999
SAVEHIST=999999
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
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=black'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black'

# colors
# https://github.com/mintty/mintty/wiki/Tips#changing-colours
autoload -Uz colors
colors

# completions
zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# prompt
fpath=($HOME/.zfuncs $fpath)
autoload -Uz promptinit
promptinit
prompt spaceship

# fzf
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -t d'
source ~/.fzf/shell/completion.zsh 2> /dev/null
source ~/.fzf/shell/key-bindings.zsh

# z command
source ~/.zfuncs/z/z.sh

# tmux shortcut
t() {
    if [ $# -eq 0 ]; then
        tmux list-sessions
    else
        tmux attach-session -t $1 || tmux new-session -s $1
    fi
}

# aliases
alias cls='printf "\033c"'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias x='exa --long --git'
alias rm='rm -i'
alias tmux='tmux -2'
alias sctl='sudo systemctl'
alias jrnl='sudo journalctl'
if type nvim > /dev/null; then
    alias vim='nvim'
    alias vi='nvim'
fi

# local settings
if [[ -e ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
