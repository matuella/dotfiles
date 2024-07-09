#!/usr/bin/env bash

# Normalize path to source relative scripts.
script_dir=$(dirname "${BASH_SOURCE[0]}")
cd "$script_dir"

source _utils/helpers.sh
source config.sh
source config_sensitive.sh

# Defines all scripts to be run, respecting order.
#
# If you want to quickly test a script, comment others from the list below.
scripts=(
    "bridge/pre-install"
    "install/brew-clis"
    "install/brew-casks"
    "install/app-store-apps"
    "install/manual-apps"
    "bridge/post-install"
    "setup/git"
    "setup/github-ssh"
    "setup/npm"
    "setup/vscode"
    "setup/flutter"
    "setup/fs"
    "setup/macos"
    "bridge/post-setup"
)

global_info "Starting full setup..."
total_steps=${#scripts[@]}
source _utils/step_counter.sh $total_steps

for script in "${scripts[@]}"; do
    global_info "[$script] Started"
    bash "$script.sh"
    global_info "[$script] Done!"
    step_finished
done

if interactive_check "Setup complete! It's recommended an OS restart, do you want to do it now?"; then
    sudo shutdown -r now
fi
