# source bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# use local bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# environment
export LANGUAGE="en_US:en"
export DEBFULLNAME='Jacob Peddicord'
export DEBEMAIL='jpeddicord@ubuntu.com'
export EDITOR='vim'
export VISUAL='vim'

# site-specific options
if [ -f "$HOME/.profile.local" ]; then
	. "$HOME/.profile.local"
fi

