#!/usr/bin/env bash

###
# Setup vscode extensions.
###

if [ -z "${DF_VSCODE_EXTENSIONS}" ]; then
    script_info "[vscode] SKIPPED: 'DF_VSCODE_EXTENSIONS' not set on config files..."
    exit 0
fi

eval_brew
while IFS='\n' read -r extension; do
    code --install-extension $extension
done <<< "$DF_VSCODE_EXTENSIONS"