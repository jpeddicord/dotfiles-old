function t
    if test (count $argv) -eq 0
        tmux list-sessions
    else
        tmux attach-session -t $argv[1] or tmux new-session -s $argv[1]
    end
end
