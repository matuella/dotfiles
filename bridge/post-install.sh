#!/usr/bin/env bash

script_info "[brew] Cleaning up brew..."
brew cleanup

if interactive_check "[manual]Do you want to perform a series of manual configurations?"; then
    open /Applications/CopyClip.app
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup CopyClip by ticking the start app at startup! Press any key to continue"

    open /Applications/1Password.app
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup 1Password by inserting the credentials! Press any key to continue"

    open /Applications/Google\ Chrome.app
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup Google Chrome setting as default browser and signing in to gmail account! Press any key to continue"

    open /Applications/Spotify.app
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup Spotify by inserting the credentials! Press any key to continue"

    open /Applications/Raycast.app
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup Raycast! Press any key to continue"

    open ~
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup Finder:
    1. Settings -> Update "New finder windows show" to User folder.
    2. Remove all unwanted Favorites. Add Projects and User folders to it.
    Press any key to continue"

    open /Applications/System\ Settings.app
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup Settings:
    1. Displays -> Update screens dispositions: needs to be connected to it.
    2. Touch Id & Password -> Enable OS to be unlocked using Watch proximity.
    Press any key to continue"
fi