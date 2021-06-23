#!/bin/bash

# check os: linux | mac:: Is this needed????
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)       isLinux=1;;
  Darwin*)      isLinux=0;;
  *)            echo "Fail to find OS! Found: $unameOut" && exit 1;;
esac

echo "Found OS: $unameOut";


if [[ $isLinux ]]
  then
    sudo apt-get install build-essential -y
fi

# add brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages
brew install \
    bash-completion \
    bazelisk \
    git-gui \
    maven \
    nvm \
    python@3.7 \
    tmux \
    yarn \
    deno \
    tmux \

# deno
deno upgrade --version 1.8.3
deno install --allow-read --allow-write --allow-run --unstable -f --name dnit https://deno.land/x/dnit@dnit-v1.12.1/main.ts

# install sdkman - OpenJDK8
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk install java 11.0.11.j9-adpt

# Install python packages
sudo pip3 install doit pystache
