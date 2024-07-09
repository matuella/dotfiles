#!/usr/bin/env bash

function update_brew_recipes() {
    script_info "[brew] Updating recipes..."
    brew update
}

if [[ $(command -v brew) == "" ]]; then
    script_info "[brew] Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    # Make sure that after installed, it's available for this script.
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    eval_brew

    update_brew_recipes
else
    script_info "[brew] SKIPPED: brew already installed"

    if interactive_check "[brew] Do you want to update brew recipes anyways?"; then
        update_brew_recipes
    fi
fi
