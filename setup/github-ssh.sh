#!/usr/bin/env bash

###
# Create and add a SSH key to GitHub.
###

script_info "[github-ssh] Generating SSH key pair..."
if [ -z "$DF_SSH_KEY_PREFIX" ] || [ -z "$DF_SSH_KEY_EMAIL" ] || [ -z "$DF_SSH_PASSPHRASE" ]; then
    script_info "[github-ssh] SKIPPED: 'DF_SSH_*' properties not set on config files..."
    exit 0
fi

auth_key_file="auth_${DF_SSH_KEY_PREFIX}_id_ed25519"
signing_key_file="signing_${DF_SSH_KEY_PREFIX}_id_ed25519"

if test -f "$HOME/.ssh/$auth_key_file" || test -f "$HOME/.ssh/$signing_key_file"; then
    script_info "[github-ssh] SKIPPED: at least one github ssh key already exists..."
    exit 0
fi

eval_brew
ssh-keygen -t ed25519 -N "$DF_SSH_PASSPHRASE" -f ~/.ssh/$auth_key_file -C "$DF_SSH_KEY_EMAIL"
ssh-keygen -t ed25519 -N "$DF_SSH_PASSPHRASE" -f ~/.ssh/$signing_key_file -C "$DF_SSH_KEY_EMAIL"
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
  IdentityFile ~/.ssh/$auth_key_file" >> ~/.ssh/config

script_info "[github-ssh] Adding (ssh-add) keychain usage to key..."

# Workaround to not ask for passphrase: https://stackoverflow.com/a/73624704
tmp_askpass=$(mktemp)
printf '#!/bin/sh\necho "$DF_SSH_PASSPHRASE"\n' >> $tmp_askpass
chmod +x $tmp_askpass
SSH_ASKPASS_REQUIRE=force SSH_ASKPASS="$tmp_askpass" ssh-add --apple-use-keychain ~/.ssh/$auth_key_file
SSH_ASKPASS_REQUIRE=force SSH_ASKPASS="$tmp_askpass" ssh-add --apple-use-keychain ~/.ssh/$signing_key_file
rm -f "$tmp_askpass"

# Add gh to known hosts to prevent asking passphrase on first clone using SSH
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Configure git to use the proper SSH key to sign commits globally
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/$signing_key_file.pub

prompt_important "[github-ssh] MANUAL OPERATION REQUIRED: Your AUTHENTICATION SSH is setup!
Press any key to copy the public key to your clipboard and open the GitHub SSH screen. Create a key there of type Authentication!"
pbcopy < ~/.ssh/$auth_key_file.pub
open "https://github.com/settings/ssh/new"

prompt_important "[github-ssh] MANUAL OPERATION REQUIRED: Your SIGNING SSH is setup!
Press any key to copy the public key to your clipboard and open the GitHub SSH screen. Create a key there of type Signing!"
pbcopy < ~/.ssh/$signing_key_file.pub
open "https://github.com/settings/ssh/new"

prompt_important "[github-ssh] MANUAL OPERATION REQUIRED: Once you've created it, press any key to continue."
