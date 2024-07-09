#!/usr/bin/env bash

script_info "[brew] Installing CLI packages..."
if [ -z "${DF_BREW_CLIS}" ]; then
    script_info "[brew] SKIPPED: 'DF_BREW_CLIS' not set on config files..."
    exit 0
fi

eval_brew
while IFS='\n' read -r cli; do
    brew install $cli
done <<< "$DF_BREW_CLIS"
