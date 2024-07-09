# dotfiles

An abstraction to help configuring macOS, by defining installation/configuration scripts.

> [!NOTE]  
> This is a really opinionated list of scripts, but the abstraction might be of use for you.

## Running

To run this, you just need to execute the `run.sh` script directly and everything else is called by it.

As an example, this is what I usually do whenever I start on a pristine system:
```sh
curl -L -O https://github.com/matuella/dotfiles/archive/main.zip
unzip 'main.zip'
read -p "$(echo -e "Update 'config.sh' and 'config_sensitive.sh' with desired values. Press any key once done with changes.")"
chmod +x dotfiles-main/run.sh
dotfiles-main/run.sh
```

### How it's done

`run.sh` is the entrypoint that coordinates all scripts by declaring it, orderly, through the `scripts` variable.

As you can see, it's a relatively simple script that does nothing but call other heavily opinionated scripts, with a couple of extras:
- Allows script execution by declaration order in the `scripts` var, located in `run.sh`.
- Prints logs and count steps by using helper functions in `_utils/*`.
- Centralizes all behaviors through `config.sh` and `config_sensitive.sh`.

To use the same structure and replace with your "opinion", simply:
1. Add/remove scripts from `/install`,`/setup` and `/bridge` folders.
2. Update `config` and `config_sensitive` values, adding/removing variables as necessary.
3. Update call orders in `run.sh`, specifically in the `scripts` variable. 

... and *voilà*, you're set.

### Abstraction

The current abstraction is just a segregation to make it easier to reason about grouping similar scripts, as it affects nothing on the script behavior.

- `_utils` store utility scripts that are used throughout all others, such as print functions.
- `bridge` are scripts that run before/after a group of scripts, such as a clean-up behavior.
- `install` are scripts that install applications.
- `setup` are scripts that configure installed applications, system behavior and honestly, anything else that can be configured.
