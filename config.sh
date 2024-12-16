# IMPORTANT!
# DO PREFIX all config vars with DF (short for Dotfiles) to avoid conflicts with other variables.
# I've found the hard way to do it, like when clashing `VSCODE_EXTENSIONS` and `NVM_DIR`.


# copyclip - https://itunes.apple.com/br/app/copyclip-clipboard-history-manager/id595191960
# xcode - https://itunes.apple.com/br/app/xcode/id497799835
export DF_APP_STORE_APPS="595191960
497799835"

export DF_BREW_CLIS="git
gnupg
nvm
vim
wget
zsh
zsh-completions
cocoapods
jq"

export DF_BREW_CASKS="1password
android-studio
google-chrome
postman 
visual-studio-code
discord
spotify
slack
docker
postico"

export DF_VSCODE_EXTENSIONS="tamasfe.even-better-toml
Dart-Code.dart-code
Dart-Code.flutter
Gruntfuggly.todo-tree
janisdd.vscode-edit-csv
mariomatheu.syntax-project-pbxproj
yzhang.markdown-all-in-one
github.copilot"

export DF_NPM_PACKAGES="firebase-tools
tsx"

# All of these will be prefixed with "$HOME" on the scripts.
export DF_FLUTTER_DIR="flutter"
export DF_OHMYZSH_DIR=".oh-my-zsh"
export DF_NVM_DIR=".nvm"

# If set to `1`, disables all logs.
export DF_SILENT=0
