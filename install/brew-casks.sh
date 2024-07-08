#!/usr/bin/env bash

script_info "[brew] Installing cask apps..."
if [ -z "${BREW_CASKS}" ]; then
    script_info "[brew] SKIPPED: 'BREW_CASKS' not set on 'config.sh'..."
    exit 0
fi

brew install --cask $BREW_CASKS
