#!/usr/bin/env bash

script_info "[app_store] Installing mas..." # https://github.com/mas-cli/mas
if [ -z "${APP_STORE_APPS}" ]; then
    script_info "[app_store] SKIPPED: 'APP_STORE_APPS' not set on 'config.sh'..."
    exit 0
fi

brew install mas

open /System/Applications/App\ Store.app
prompt_important "[app_store] MANUAL OPERATION REQUIRED: Opening the AppStore... if not signed-in, please sign-in manually and then press any key to continue."
# mas signin $2 # CURRENTLY DEPRECATED -> SIGN IN THROUGH APP STORE MANUALLY

script_info "[app_store] Installing AppStore apps..."
mas install ${APP_STORE_APPS[@]}

script_info "[app_store] Uninstalling mas..."
brew uninstall mas
