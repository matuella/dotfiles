#!/usr/bin/env bash

script_info "[brew] Installing cask apps..."
if [ -z "${DF_BREW_CASKS}" ]; then
    script_info "[brew] SKIPPED: 'DF_BREW_CASKS' not set on config files..."
    exit 0
fi

eval_brew
while IFS='\n' read -r cask; do
    brew install --cask $cask
done <<< "$DF_BREW_CASKS"
