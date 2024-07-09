#!/usr/bin/env bash

###
# Update system 'defaults' with personal preferences.
###

script_info "[macos] Updating system preferences..."
# Removing all default Dock apps
defaults write com.apple.dock persistent-apps -array 

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Remove the holding down a key to show accentuations
defaults write -g ApplePressAndHoldEnabled -bool false

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable hidden files by default in finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Control Center Modules > Sound > Always Show in Menu Bar
defaults write "com.apple.controlcenter" "NSStatusItem Visible Sound" -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set the icon size of Dock items to 48 pixels for optimal size/screen-realestate
defaults write com.apple.dock tilesize -int 48
