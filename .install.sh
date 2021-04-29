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
  echo 'eval "$(/home/docker/.linuxbrew/bin/brew shellenv)"' >> /home/docker/.profile
  eval "$(/home/docker/.linuxbrew/bin/brew shellenv)" ;
  sudo apt-get install build-essential -y
  brew install gcc
else
  echo 'Installing packages'
  
  # add brew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # install brew formulaes, add new line [formulae name \]
  brew install \
    bash-completion \
    bazelisk \
    git-gui \
    maven \
    nvm \
    python@3.7 \
    tmux \
    yarn \
fi


# deno
curl -fsSL https://deno.land/x/install/install.sh | sh
deno upgrade --version 1.8.3
deno install --allow-read --allow-write --allow-run --unstable -f --name dnit https://deno.land/x/dnit@dnit-v1.12.1/main.ts

# install sdkman - OpenJDK8
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk install java 8.0.282.j9-adpt


# Install python packages
sudo pip3 install doit pystache
