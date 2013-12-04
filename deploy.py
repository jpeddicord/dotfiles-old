#!/usr/bin/env python
"""
If you're not Jacob Peddicord, you probably don't want to run this.
It will mess with your own dotfiles and use mine instead.
"""

import os
from subprocess import call


# links will be installed in the order they are here
LINKS = [
    # (source, name)
    ('vim', '.vim'),
    ('vimrc', '.vimrc'),
    ('gvimrc', '.gvimrc'),
    ('zshenv', '.zshenv'),
    ('zlogin', '.zlogin'),
    ('zshrc', '.zshrc'),
    ('zprezto', '.zprezto'),
    ('zpreztorc', '.zpreztorc'),
    ('dir_colors', '.dir_colors'),
    ('gitconfig', '.gitconfig'),
    ('tmux.conf', '.tmux.conf'),
    ('Xresources', '.Xresources'),
    ('ssh/config', '.ssh/config'),
]

def setup():
    print "Updating submodules..."
    call(['git', 'submodule', 'update', '--init', '--recursive'])
    print "Submodule update complete."

def compile_ssh_config():
    print "Building ~/.ssh/config..."
    sources = ['~/Dropbox/.ssh_host_config', '~/.ssh/host_config', 'ssh/config.tail']
    with open('ssh/config', 'w') as out:
        for fname in sources:
            fname = os.path.expanduser(fname)
            if os.path.exists(fname):
                with open(fname) as src:
                    out.write(src.read())
                    print "  " + fname
    print "Created."

def make_links(links):
    for source, name in links:
        print "Installing", source

        # sanity check
        if not os.path.exists(source):
            print "  Source file not found!"
            continue

        source = os.path.abspath(source)
        location = os.path.join(os.path.expanduser('~'), name)

        # check if a link was already made
        if os.path.islink(location):
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
            os.chmod(source, 0755)
        except Exception as ex:
            print "  Failed ({0})".format(ex)


if __name__ == '__main__':
    setup()
    compile_ssh_config()
    make_links(LINKS)
