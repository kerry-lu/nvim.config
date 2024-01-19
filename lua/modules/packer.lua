-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

use { "folke/tokyonight.nvim" }

use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}

use {
    "cbochs/grapple.nvim",
    requires = { "nvim-lua/plenary.nvim" },
}

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use {
    "akinsho/toggleterm.nvim", tag = '*',
    config = function()
        require("toggleterm").setup()
    end
}

use { "neovim/nvim-lspconfig" }

use { "sindrets/diffview.nvim" }

use { "williamboman/mason.nvim" }

-- Amazon specific packages
use {
  "lukerry@git.amazon.com:pkg/NinjaHooks",
  branch = "mainline",
  rtp = 'configuration/vim/amazon/brazil-config',
}

end)
