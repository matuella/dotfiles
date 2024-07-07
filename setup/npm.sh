#!/usr/bin/env bash

function check_package() {
    if [ `npm list -g | grep -c $1` -eq 0 ]; then
        npm install -g $1
    else
        script_info "[npm] SKIPPING: $1 already installed"
    fi
}

script_info "[npm] Installing node latest using nvm..."
NVM_DIR=~/.nvm
if [ -d "$NVM_DIR" ] && [ -n "${NPM_PACKAGES}" ]; then
    source $(brew --prefix nvm)/nvm.sh
    nvm install node # "node" is an alias for the LTS version
    script_info "[npm] Installing global npm packages..."

    for package in "${NPM_PACKAGES[@]}"; do
        check_package $package
    done
else
    script_info "[nvm] SKIPPING: nvm not installed or 'NPM_PACKAGES' not set in 'config.sh'"
fi
