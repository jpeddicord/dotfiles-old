set fish_prompt_pwd_dir_length 0
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showuntrackedfiles 1
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream informative

function fish_prompt
    set -l cmd_status $status
    echo

    # ssh prefix
    test $SSH_TTY
    and echo -n (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '

    # root prefix
    test "$USER" = 'root'
    and echo (set_color red)"#"

    # directory
    echo (set_color 129999)(prompt_pwd)(__fish_git_prompt)
    
    # command line
    if test $cmd_status -eq 0
        echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    else
        echo -n (set_color red)'❯❯❯ '
    end
end
