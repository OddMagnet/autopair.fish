function _autopair_backspace
    set --local index (commandline --cursor)
    set --local buffer (commandline)

    test $index -ge 1 &&
        contains -- (string sub --start=$index --length=2 -- "$buffer") $autopair_pairs &&
        commandline --function delete-char
    if set --query autopair_backspace_command[1]; and functions --query $autopair_backspace_command[1]
        $autopair_backspace_command
    else
        commandline --function backward-delete-char
    end
end
