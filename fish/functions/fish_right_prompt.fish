function fish_right_prompt
    if test "$CMD_DURATION" -gt 500
        printf (set_color -d magenta)'%.2f' (math $CMD_DURATION / 1000)
    end
end
