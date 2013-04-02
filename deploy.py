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
    ('vim/gvimrc', '.gvimrc'),
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

        if os.readlink(location) == source:
            print "  Link already present; skipping"
            continue
        else:
            print "  Link present but pointed elsewhere; repairing"
            os.remove(location)

    # or if something else was there
    elif os.path.exists(location):
        print "  File exists; removing to link"
        renamed = location + "~"
        os.rename(location, renamed)
        print "  Old file backed up as", renamed

    print "  Linking", source, "at", location
    try:
        os.symlink(source, location)
    except Exception as ex:
        print "  Failed ({0})".format(ex)
