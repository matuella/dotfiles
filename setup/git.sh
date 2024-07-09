#!/usr/bin/env bash

###
# Update git global config with personal info.
###

eval_brew
script_info "[git] Setting global config..."
if [ -z "${DF_GIT_USERNAME}" ]; then
    script_info "[git] SKIPPED: 'DF_GIT_USERNAME' not set on config files..."
else
    git config --global user.name $DF_GIT_USERNAME
fi

if [ -z "${DF_GIT_EMAIL}" ]; then
    script_info "[git] SKIPPED: 'DF_GIT_EMAIL' not set on config files..."
else
    git config --global user.email $DF_GIT_EMAIL
fi

git config --global credential.helper osxkeychain
