# i18n
if [[ -z "$LANG" ]]; then
	export LANG='en_US.UTF-8'
fi

# editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# path
typeset -gU cdpath fpath mailpath path
path=(
	~/bin
	~/.local/bin
	$path
	~/.cargo/bin
	~/.fzf/bin
)

# temp
if [[ ! -d "$TMPDIR" ]]; then
	export TMPDIR="/tmp/$USER"
	mkdir -p -m 700 "$TMPDIR"
fi
TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
	mkdir -p "$TMPPREFIX"
fi

# sundry
export SUDO_PROMPT="$(echo -ne '\a\e[0;91m')[sudo]$(echo '\e[0m') password for %u: "
export FZF_DEFAULT_COMMAND='ag -g ""'

# local settings
if [[ -e ~/.zshenv.local ]]; then
	source ~/.zshenv.local
fi
