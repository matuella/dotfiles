#!/usr/bin/env bash

script_info "[brew] Installing CLI packages..."
if [ -z "${DF_BREW_CLIS}" ]; then
    script_info "[brew] SKIPPED: 'DF_BREW_CLIS' not set on config files..."
    exit 0
fi

brew install $DF_BREW_CLIS