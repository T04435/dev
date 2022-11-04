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
    git-gui \
    maven \
    nvm \
    python@3.7 \
    tmux \
    yarn \
    tmux \

# Install python packages
sudo pip3 install doit pystache
