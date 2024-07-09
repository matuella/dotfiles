#!/usr/bin/env bash

script_info "[manual_apps] Installing manual apps..."

script_info "[manual_apps][flutter] Installing..."
if [ -n "$HOME/$DF_FLUTTER_DIR" ]; then
    if [ -d "$HOME/$DF_FLUTTER_DIR" ]; then
        script_info "[manual_apps][flutter] SKIPPING: flutter already installed"
    else
        git clone https://github.com/flutter/flutter.git -b stable "$HOME/$DF_FLUTTER_DIR"
    fi
else
    script_info "[manual_apps][flutter] SKIPPED: 'DF_FLUTTER_DIR' not set on config files..."
fi

script_info "[manual_apps][ohmyzsh] Installing..."
if [ -n "$HOME/$DF_OHMYZSH_DIR" ]; then
    if [ -d "$HOME/$DF_OHMYZSH_DIR" ]; then
        script_info "[manual_apps][ohmyzsh] SKIPPING: ohmyzsh already installed"
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
else
    script_info "[manual_apps][ohmyzsh] SKIPPED: 'DF_OHMYZSH_DIR' not set on config files..."
fi