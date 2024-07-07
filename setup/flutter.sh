#!/usr/bin/env bash

script_info "[flutter] Setting up first run and licenses..."
FLUTTER_DIR=~/flutter
if [ -d "$FLUTTER_DIR" ]; then
    PATH="$PATH:$HOME/flutter/bin"

    open /Applications/Android\ Studio.app
    prompt_important "[flutter] MANUAL OPERATION REQUIRED: Opening the Android Studio... please proceed with the default setup manually and then press ENTER/RETURN when done"

    # Requires the xcode to be "ran" at least once -> possibly this two commands will solve it
    prompt_important "[flutter] MANUAL OPERATION REQUIRED: Next you will be requested to agree with licenses, follow the agreements carefully. Press ENTER/RETURN."
    sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -runFirstLaunch
    sudo xcodebuild -license
    pod setup

    flutter doctor --android-licenses
    flutter doctor -v
    prompt_important "[flutter] 'doctor' finished, make sure that everything is as expected. Press any button to continue."
else
    script_info "[flutter] SKIPPING: flutter not installed"
fi
