#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
   echo "Setting up for MacOS..."
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
   echo "Setting up for Linux..."
fi

# neovim
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install neovim
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo 'alias vi=nvim' >> ~/.zshrc
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo 'alias vi=nvim' >> ~/.bashrc
fi

# telescope live_grep
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get install ripgrep
fi

# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 2> /dev/null
