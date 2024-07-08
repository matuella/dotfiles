#!/usr/bin/env bash

# Normalize path to source relative scripts.
script_dir=$(dirname "${BASH_SOURCE[0]}")
cd "$script_dir"

source ./_utils.sh
source ./_config.sh
source ./_sensitive_config.sh

total_steps=$(find setup install -type f | wc -l | tr -d '[:space:]')
current_step=0
function step_finished() {
    current_step=$((current_step + 1))
    global_info "Step $current_step/$total_steps done"
}

global_info "Starting full setup..."
global_info "Executing pre-install..."
# Run the pre-install requirements for all install scripts.
bash ./pre-install.sh
global_info "Pre-install done!"

# Execute scripts in 'install' folder.
find install -type f | while read -r script; do
    global_info "Executing $script..."
    bash "$script"
    step_finished
done

# Clean-up anything that remains from out installs.
global_info "Executing post-install..."
bash ./post-install.sh
global_info "Post-install done!"

# Execute scripts in 'setup' folder.
find setup -type f | while read -r script; do
    global_info "Executing $script..."
    bash "$script"
    step_finished
done

if interactive_check "Setup complete! It's recommended an OS restart, do you want to do it now?"; then
    sudo shutdown -r now
fi
