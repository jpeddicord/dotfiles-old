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
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=black'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black'

# colors: very roughly "ayu" https://github.com/ayu-theme/ayu-colors
# https://github.com/mintty/mintty/wiki/Tips#changing-colours
autoload -Uz colors
colors
echo -ne '\e]10;#e6e1cf\a'    # foreground
echo -ne '\e]11;#0f1419\a'    # background
echo -ne '\e]12;#515c66\a'    # cursor
echo -ne '\e]4;0;#000000\a'   # black
echo -ne '\e]4;1;#ff3333\a'   # red
echo -ne '\e]4;2;#86b300\a'   # green
echo -ne '\e]4;3;#ffb454\a'   # yellow
echo -ne '\e]4;4;#59c2ff\a'   # blue
echo -ne '\e]4;5;#a37acc\a'   # magenta
echo -ne '\e]4;6;#4cbf99\a'   # cyan
echo -ne '\e]4;7;#e2e4e7\a'   # white (light grey really)
echo -ne '\e]4;8;#1d242c\a'   # bold black (i.e. dark grey)
echo -ne '\e]4;9;#f07178\a'   # bold red
echo -ne '\e]4;10;#c2d94c\a'  # bold green
echo -ne '\e]4;11;#ffd580\a'  # bold yellow
echo -ne '\e]4;12;#73d0ff\a'  # bold blue
echo -ne '\e]4;13;#d4bfff\a'  # bold magenta
echo -ne '\e]4;14;#95e6cb\a'  # bold cyan
echo -ne '\e]4;15;#ffffff\a'  # bold white
eval `dircolors ~/.dir_colors`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# completions
zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# prompt
fpath=($HOME/.zfuncs $fpath)
autoload -Uz promptinit
promptinit
prompt pure

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
alias l='ls -lh'
alias ll='l -A'
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
