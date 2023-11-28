#!/bin/bash

# Node is required for Copilot.
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew list -q node || brew install node
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt-get update
    sudo apt-get install nodejs -y
fi

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

echo 'alias vi=nvim' >> ~/.bashrc 

# xclip clipboard
sudo apt-get update
sudo apt-get install xclip

# telescope live_grep
sudo apt-get install ripgrep

# lsp
# python
sudo apt-get install npm
sudo npm i -g pyright 

# c, cpp, objc, objcpp, cuda, proto
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 16
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-16 100

# sshfs
sudo apt-get install sshfs

# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 2> /dev/null

# copilot
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim 2> /dev/null

# cleanup
rm nvim.appimage llvm.sh
