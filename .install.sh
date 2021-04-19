#!/bin/bash

# check os: linux | mac:: Is this needed????
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)	isLinux=truen;;
  Darwin*)	isLinux=false;;
  *)		echo "Fail to find OS! Found: $unameOut" && exit 1;;
esac

echo "Found OS: $unameOut";

# add brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew formulaes, add new line [formulae name \]
brew install \
 bash-completion \
 bazelisk \
 deno \
 git-gui \
 maven \
 nvm \
 python@3.7 \
 tmux
 yarn \

# Install python packages
sudo pip3 install doit pystache

# install sdkman
curl -s "https://get.sdkman.io" | bash
# source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version




