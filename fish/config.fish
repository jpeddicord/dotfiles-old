# set language
if not set -q LANG
    set -gx LANG "en_US.UTF-8"
end

set -gx EDITOR "vim"
set -gx VISUAL "vim"
set -gx PAGER "less"

set -gx PATH ~/bin ~/.local/bin $PATH ~/.cargo/bin ~/.fzf/bin

set -gx SUDO_PROMPT (set_color -b magenta white)"[sudo]"(set_color normal)" password for %u: "
