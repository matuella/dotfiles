#!/usr/bin/env bash

script_info "[git] Setting global config..."

if [ -z "${GIT_USERNAME}" ]; then
    script_info "[git] SKIPPED: 'GIT_USERNAME' not set on 'config.sh'..."
else
    git config --global user.name $GIT_USERNAME
fi

if [ -z "${GIT_EMAIL}" ]; then
    script_info "[git] SKIPPED: 'GIT_EMAIL' not set on 'config.sh'..."
else
    git config --global user.email $GIT_EMAIL
fi

git config --global credential.helper osxkeychain