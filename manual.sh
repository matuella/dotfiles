#!/usr/bin/env bash

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
    prompt_important "[manual] MANUAL OPERATION REQUIRED: Setup Raycast by inserting the credentials! Press any key to continue"
fi