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
	~/.local/share/bin
	$path
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

