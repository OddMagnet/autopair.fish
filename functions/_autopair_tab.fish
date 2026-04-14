function _autopair_tab
    commandline --paging-mode && down-or-search && return

    string match --quiet --regex -- '\$[^\s]*"$' (commandline --current-token) &&
        commandline --function end-of-line --function backward-delete-char
    if set --query autopair_complete_command[1]; and functions --query $autopair_complete_command[1]
        $autopair_complete_command
    else
        commandline --function complete
    end
end
