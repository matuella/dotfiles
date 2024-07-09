#!/usr/bin/env bash

###
# Create and add a SSH key to GitHub.
###

script_info "[github-ssh] Generating SSH key pair..."
if [ -z "$DF_SSH_KEY_FILE" ] || [ -z "$DF_SSH_KEY_EMAIL" ] || [ -z "$DF_SSH_PASSPHRASE" ]; then
    script_info "[github-ssh] SKIPPED: 'DF_SSH_*' properties not set on config files..."
    exit 0
fi

if test -f "$HOME/.ssh/$DF_SSH_KEY_FILE"; then
    script_info "[github-ssh] SKIPPED: github ssh key already exists..."
    exit 0
fi

ssh-keygen -t ed25519 -N "$DF_SSH_PASSPHRASE" -f ~/.ssh/$DF_SSH_KEY_FILE -C "$DF_SSH_KEY_EMAIL"
script_info "[github-ssh] Initializing ssh-agent..."
eval "$(ssh-agent -s)"

script_info "[github-ssh] Adding github host to ssh config..."
ssh_config=~/.ssh/config.txt
if [ ! -f $ssh_config ]; then
    touch $ssh_config
fi

echo "
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/$DF_SSH_KEY_FILE" >> ~/.ssh/config

script_info "[github-ssh] Adding (ssh-add) keychain usage to key..."

# Workaround to not ask for passphrase: https://stackoverflow.com/a/73624704
tmp_askpass=$(mktemp)
printf '#!/bin/sh\necho "$SSH_PASSPHRASE"\n' >> $tmp_askpass
chmod +x $tmp_askpass
SSH_ASKPASS_REQUIRE=force SSH_ASKPASS="$tmp_askpass" ssh-add --apple-use-keychain ~/.ssh/$DF_SSH_KEY_FILE
rm -f "$tmp_askpass"

# Add gh to known hosts to prevent asking passphrase on first clone using SSH
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Configure git to use the SSH key to sign commits globally
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/$DF_SSH_KEY_FILE.pub

pbcopy < ~/.ssh/$DF_SSH_KEY_FILE.pub
prompt_important "[github-ssh] MANUAL OPERATION REQUIRED: Your SSH is setup and the public key is copied to your clipboard!
Press any key to open the GitHub SSH settings page and paste the key there, with a proper title."

open "https://github.com/settings/ssh/new"
prompt_important "[github-ssh] MANUAL OPERATION REQUIRED: Once you've created it, press any key to continue."
