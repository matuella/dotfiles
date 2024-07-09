#!/usr/bin/env bash

###
# Colors
###
export BLUE='\033[1;34m'
export RED='\033[1;31m'
export YELLOW='\033[1;33m'
export GREEN='\033[1;32m'
export NC='\033[0m' # No Color

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

## Prints a non-interrupting script message.
function script_info() {
    if [ -n $DF_SILENT ] && [ "$DF_SILENT" -eq 1 ]; then
        return 0
    fi
    echo -e $BLUE"$1"$NC
}

## Prints a non-interrupting global message, meaning the coordinator script.
function global_info() {
    if [ -n $DF_SILENT ] && [ "$DF_SILENT" -eq 1 ]; then
        return 0
    fi
    
    echo -e $GREEN"$1"$NC
}

## Prints an interrupting message, requiring a key press to move on.
function prompt_important() {
    read -p "$(echo -e $RED"$1"$NC)"
}

function eval_brew() {
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

export -f interactive_check
export -f script_info
export -f global_info
export -f prompt_important
export -f eval_brew
