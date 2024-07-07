#!/usr/bin/env bash

script_info "[FS] Creating project's folder structure..."
mkdir -p ~/Projects/{External,Personal}

script_info "[FS] Creating '.zshrc'..."
echo "# NVM
export NVM_DIR=~/.nvm
source \$(brew --prefix nvm)/nvm.sh

# Flutter
export PATH=\"\$PATH:\$HOME/flutter/bin/:\$HOME/.pub-cache/bin\"

# Aliases and Utilities
alias reload=\"source \$HOME/.zshrc\"

function command_exists () {
  local cmd=\$1
  if ! command -v \$cmd &> /dev/null
  then
    return 1
  fi

  return 0
}

# Oh My ZSH
export ZSH=\"\$HOME/.oh-my-zsh\"
ZSH_THEME=gozilla

plugins=(
  git
)

source \$ZSH/oh-my-zsh.sh" > ~/.zshrc