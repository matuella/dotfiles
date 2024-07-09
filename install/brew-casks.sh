#!/usr/bin/env bash

script_info "[brew] Installing cask apps..."
if [ -z "${DF_BREW_CASKS}" ]; then
    script_info "[brew] SKIPPED: 'DF_BREW_CASKS' not set on config files..."
    exit 0
fi

brew install --cask $DF_BREW_CASKS
