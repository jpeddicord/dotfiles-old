#!/usr/bin/env python
"""
If you're not Jacob Peddicord, you probably don't want to run this.
It will mess with your own dotfiles and use mine instead.
"""

import os


# links will be installed in the order they are here
LINKS = [
    # (source, name)
    ('vim', '.vim'),
    ('vim/vimrc', '.vimrc'),
    ('bashrc', '.bashrc'),
    ('gitconfig', '.gitconfig'),
    ('profile', '.profile'),
    ('ssh_config', '.ssh/config'),
    ('tmux.conf', '.tmux.conf'),
]

for source, name in LINKS:
    print "Installing", source

    # sanity check
    if not os.path.exists(source):
        print "  Source file not found!"
        continue

    source = os.path.abspath(source)
    location = os.path.join(os.path.expanduser('~'), name)

    # check if a link was already made
    if os.path.islink(location):
        print "  Link already present, skipping"
        continue

    # or if something else was there
    elif os.path.exists(location):
        print "  File exists, removing to link"
        os.remove(location)

    print "  Linking", source, "at", location
    os.symlink(source, location)
