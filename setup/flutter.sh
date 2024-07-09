#!/usr/bin/env bash

###
# Setup flutter first run requirements and licenses.
###

if [ -z "$DF_FLUTTER_DIR" ]; then
    script_info "[flutter] SKIPPED: flutter not installed or not set on config files..."
    exit 0
fi

eval_brew
PATH="$PATH:$HOME/flutter/bin"

script_info "[flutter] Checking flutter installation health..."
# Don't know why it has no support for checking problems using the CLI.
if echo "$(flutter doctor)" | grep -q "No issues found!"; then
    script_info "[flutter] SKIPPED: Flutter seems healthy, no need to rerun setup!"
    exit 0
fi

open /Applications/Android\ Studio.app
prompt_important "[flutter] MANUAL OPERATION REQUIRED: Opening the Android Studio... please proceed with the default setup manually and then press any key to continue.
Do a double check on Android Studio -> Settings -> Languages & Frameworks -> Android SDK:
- The SDK Location is right: should be at '$HOME/Library/Android/sdk'
- [SDK Platforms] At least the latest API is installed
- [SDK Tools] Android SDK Build-Tools, Android SDK Platform-Tools, Android SDK Tools and Android Emulator are installed"
flutter doctor --android-licenses
script_info "[flutter] Android setup done!"

prompt_important "[flutter] MANUAL OPERATION REQUIRED: Next you will be requested to agree with licenses, follow the agreements carefully. Press any key to continue."
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
sudo xcodebuild -license
xcodebuild -downloadPlatform iOS
script_info "[flutter] Xcode setup done!"

script_info "[flutter] Setting up cocoapods..."
pod setup
script_info "[flutter] Cocoapods setup done!"

flutter doctor -v
prompt_important "[flutter] 'doctor' finished, make sure that everything is as expected. Press any key to continue."
