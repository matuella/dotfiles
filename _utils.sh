#!/usr/bin/env bash

## Provides an interactive check to verify if the user wants to proceed with the action.
## 
## @param {string} $1 - The message to display to the user.
##
## Taken from https://askubuntu.com/questions/551378/is-there-any-default-function-utility-to-prompt-the-user-for-yes-no-in-a-bash-sc.
function interactive_check () { 
    echo -e $YELLOW"$1"$NC
    local ans PS3="> "
    select ans in Yes No; do 
        [[ $ans == Yes ]] && return 0
        [[ $ans == No ]] && return 1
    done
}

function script_info() {
    echo -e $BLUE"$1"$NC
}

function global_info() {
    echo -e $GREEN"$1"$NC
}

function prompt_important() {
    read -p "$(echo -e $RED"$1"$NC)"
}

export -f interactive_check
export -f script_info
export -f global_info
export -f prompt_important