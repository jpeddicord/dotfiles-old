usage
=====

`./install`

whee

related packages
================

- [exa](https://the.exa.website/)
- [fish](https://fishshell.com/)
- [fd](https://github.com/sharkdp/fd)
- [icdiff](https://github.com/jeffkaufman/icdiff)
- [neovim](https://github.com/neovim/neovim)
- [ranger](https://github.com/ranger/ranger)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [tmux](https://github.com/tmux/tmux)

all in one go
-------------

```bash
## packaged stuff
# ubuntu
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt install build-essential fish icdiff neovim ranger tmux
# arch
sudo pacman -Sy base-devel fish neovim ranger tmux
yay icdiff

## rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## rust-based utils
cargo install exa fd-find ripgrep
```

maintenance
===========

`git submodule update --recursive --remote`