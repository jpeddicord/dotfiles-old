function vim
    if type -q nvim
        nvim $argv
    else
        vim $argv
    end
end
