#!/usr/bin/env bash

script_info "[brew] Installing CLI packages..."
if [ -z "${BREW_CLIS}" ]; then
    script_info "[brew] SKIPPED: 'BREW_CLIS' not set on 'config.sh'..."
    exit 0
fi

brew install "${BREW_CLIS[@]}"