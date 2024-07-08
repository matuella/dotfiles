# dotfiles

macOS configuration files, with a bunch of personal preferences.

## Running

1. Set `_config.sh` and `_sensitive_config.sh` with your preferences. Those unset will be skipped during install scripts.

`run.sh` is the entrypoint that coordinates all scripts. It basically:
1. Runs the `pre-install.sh`, to prepare everything needed in all `install/*.sh` scripts.
2. Runs all `/install` scripts. Here, put all required application downloads.
3. Runs the `post-install.sh`, to clean-up install scripts.
4. Runs all `/setup` scripts. Here, put scripts to configure your applications.
5. Runs `manual.sh`, a completely optional script just to remember doing manual stuff that are usually a pain to automate.

As you can see, it's a really simple script that does nothing but coordinate other heavily opinionated scripts.

Simply remove the unwanted scripts, add new ones and voilà, everything should run according to the steps above.

## Scripts

- `_config` and `_sensitive_config`: exports variables that will determine the behavior of the scripts. Loaded as soon as `run.sh` is called.
- `_utils` exports helper functions used through all scripts. Loaded as soon as `run.sh` is called.
- Ordered (by execution):
  1. `run` -> entrypoint.
  2. `pre-install`.
  3. All `install` scripts. Not ordered.
  4. `post-install`.
  5. All `setup` scripts. Not ordered.
  6. `manual`.


TODO: OHMYZSH setup not working dir check
TODO: Git setup not working
TODO: Flutter setup not pointing to brew install -> remember to update .zshrc
TODO: VSCODE setup bugged for some reason -> trying read as a file
TODO: NVM/NPM setup not working
TODO: Steps counter resetting