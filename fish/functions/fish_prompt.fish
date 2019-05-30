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
    and echo -n (set_color red)'# '

    # directory
    echo -n (set_color 129999)(prompt_pwd)' '

    # git
    echo -n (__fish_git_prompt '(%s) ')

    # duration
    if test "$CMD_DURATION" -gt 500
        if test "$CMD_DURATION" -gt 60000
            printf (set_color -d magenta)'%.0fm%.0fs' (math $CMD_DURATION / 1000 / 60) (math $CMD_DURATION / 1000 % 60)
        else
            printf (set_color -d magenta)'%.2fs' (math $CMD_DURATION / 1000)
        end
        set_color normal
    end

    # command line
    echo
    if test $cmd_status -eq 0
        echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    else
        echo -n (set_color red)'❯❯❯ '
    end
end
