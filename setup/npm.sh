#!/usr/bin/env bash

###
# Setup global npm packages, using nvm.
###

function check_package() {
    if [ `npm list -g | grep -c $1` -eq 0 ]; then
        script_info "[npm] Installing $1..."
        npm install -g "$1"
    else
        script_info "[npm] SKIPPING: $1 already installed"
    fi
}

if [ -z "$DF_NVM_DIR" ]; then
    script_info "[npm] SKIPPED: 'DF_NVM_DIR' not set on config files..."
    exit 0
fi

if [ -z "$DF_NPM_PACKAGES" ]; then
    script_info "[npm] SKIPPED: 'DF_NPM_PACKAGES' not set on config files..."
    exit 0
fi

if [ ! -d "$HOME/$DF_NVM_DIR" ]; then
    mkdir "$HOME/$DF_NVM_DIR"
fi

script_info "[npm] Installing latest node using nvm..."
nvm_prefix=$(brew --prefix nvm)
[ -s "$nvm_prefix/nvm.sh" ] && \. "$nvm_prefix/nvm.sh"
nvm install --lts
# nvm use --lts
nvm alias default lts/*

script_info "[npm] Installing global npm packages..."
while IFS='\n' read -r pkg; do
    check_package "$pkg"
done <<< "$DF_NPM_PACKAGES"
