#!/usr/bin/env bash

###
# Create opinionated file-system folders and files.
###

script_info "[fs] Creating project's folder structure..."
mkdir -p ~/Projects/{External,Personal}

script_info "[fs] Creating '.zshrc'..."
echo "# NVM
export NVM_DIR=~/$DF_NVM_DIR
nvm_prefix=\$(brew --prefix nvm)
[ -s "\$nvm_prefix/nvm.sh" ] && \. "\$nvm_prefix/nvm.sh" # This loads nvm
[ -s "\$nvm_prefix/etc/bash_completion.d/nvm" ] && \. "\$nvm_prefix/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Flutter
export PATH=\"\$PATH:\$HOME/$DF_FLUTTER_DIR/bin/:\$HOME/.pub-cache/bin\"

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
script_info "[fs] Done creating '.zshrc'"