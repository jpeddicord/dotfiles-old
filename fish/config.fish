# set language
if not set -q LANG
    set -gx LANG "en_US.UTF-8"
end

# editors
set -gx EDITOR "vim"
set -gx VISUAL "vim"
set -gx PAGER "less"

# path
set -gx PATH ~/bin ~/.local/bin $PATH ~/.cargo/bin ~/.fzf/bin

# louder sudo prompt
set -gx SUDO_PROMPT (set_color -b magenta white)"[sudo]"(set_color normal)" password for %u: "(echo -e '\a')

# simple aliases
alias l 'exa --git --long'
alias ll 'exa --git --long --all'
alias rm 'rm -i'
alias tmux 'tmux -2'
alias vi 'vim'

# load up any scripts that need to run after this
for conf in ~/.config/fish/conf-after.d/*.fish
    source $conf
end
