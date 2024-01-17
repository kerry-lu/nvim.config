# Neovim Config

To setup, run the following steps in terminal:

1. `git clone https://github.com/kerrylu/nvim.config.git`
2. `cp -r nvim.config ~/.config/nvim`
3. `cd ~/.config/nvim`
4. `cp -r clangd/ ~/.config/clangd`
5. `./setup.sh`
6. `nvim .`
7. When nvim opens up, run `:PackerSync` twice.

Note: on MacOS custom color schemes will generally fail on the default terminal. I recommend using [iTerm2](https://iterm2.com/).
