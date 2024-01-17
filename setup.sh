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

# xclip clipboard
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install xclip
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get update
    sudo apt-get install xclip
fi

# telescope live_grep
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get install ripgrep
fi

# lsp
# python
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install npm
    sudo npm i -g pyright
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get install npm
    sudo npm i -g pyright
fi

# c, cpp, objc, objcpp, cuda, proto
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install llvm
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    wget https://apt.llvm.org/llvm.sh
    chmod +x llvm.sh
    sudo ./llvm.sh 16
    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-16 100
fi

# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 2> /dev/null

# cleanup
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    rm nvim.appimage llvm.sh
fi
