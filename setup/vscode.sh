#!/usr/bin/env bash

script_info "[vscode] Installing vscode extensions..."
if [ -z "${VSCODE_EXTENSIONS}" ]; then
    script_info "[brew] SKIPPED: 'VSCODE_EXTENSIONS' not set on 'config.sh'..."
    exit 0
fi

# echo "$VSCODE_EXTENSIONS"

# Convert the string into an array, splitting by new lines or spaces.
# IFS=$'\n' read -r -a  <<< "$VSCODE_EXTENSIONS"
# while IFS= read -r extension; do
#     code --install-extension $extension
# done <<< "$VSCODE_EXTENSIONS"

# echo "${splitted_extensions[@]}"

# for extension in "${splitted_extensions[@]}"; do
#     echo $extension
#     # code --install-extension $extension
# done