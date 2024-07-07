#!/usr/bin/env bash

script_info "[manual_apps] Installing manual apps..."

# script_info "[manual_apps][flutter] Installing..."
# FLUTTER_DIR="~/flutter"
# if [ -d "$FLUTTER_DIR" ]; then
#     script_info "[manual_apps][flutter] SKIPPING: flutter already installed"
# else
#     git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_DIR
# fi

script_info "[manual_apps][ohmyzsh] Installing..."
OHMYZSH_DIR="~/.oh-my-zsh"
if [ -d "$OHMYZSH_DIR" ]; then
    script_info "[manual_apps][ohmyzsh] SKIPPING: ohmyzsh already installed"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi