#!/usr/bin/env bash

script_info "[app_store] Installing AppStore apps..."
if [ -z "${DF_APP_STORE_APPS}" ]; then
    script_info "[app_store] SKIPPED: 'DF_APP_STORE_APPS' not set on config files..."
    exit 0
fi

script_info "[app_store] Installing mas..." # https://github.com/mas-cli/mas
brew install mas

# Check if we have all apps installed, to prevent opening the AppStore unnecessarily.
installed_apps_ids=$(mas list | awk '{print $1}')
has_uninstalled_app=0
while IFS='\n' read -r app_id; do
    if ! echo "$installed_apps_ids" | grep -q "^$app_id$"; then
        has_uninstalled_app=1
        break # No need to check further if at least one app needs to be installed
    fi
done <<< "$DF_APP_STORE_APPS"

if [ "$has_uninstalled_app" -eq 0 ]; then
    script_info "[app_store] SKIPPED: All apps are already installed."
    script_info "[app_store] Uninstalling mas..."
    brew uninstall mas
    exit 0
fi

open /System/Applications/App\ Store.app
prompt_important "[app_store] MANUAL OPERATION REQUIRED: Opening the AppStore... if not signed-in, please sign-in manually and then press any key to continue."
# mas signin my@email.com # CURRENTLY DEPRECATED -> SIGN IN THROUGH APP STORE MANUALLY

script_info "[app_store] Installing AppStore apps..."
mas install ${DF_APP_STORE_APPS[@]}

script_info "[app_store] Uninstalling mas..."
brew uninstall mas
