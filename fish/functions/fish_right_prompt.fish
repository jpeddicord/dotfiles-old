function fish_right_prompt
    if test "$CMD_DURATION" -gt 500
        if test "$CMD_DURATION" -gt 60000
            printf (set_color -d magenta)'%.0fm%.0fs' (math $CMD_DURATION / 1000 / 60) (math $CMD_DURATION / 1000 % 60)
        else
            printf (set_color -d magenta)'%.2fs' (math $CMD_DURATION / 1000)
        end
    end
end
