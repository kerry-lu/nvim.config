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

use "nvim-tree/nvim-web-devicons"
use {
    "cbochs/grapple.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
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

use { "sindrets/diffview.nvim" }

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    {'mfussenegger/nvim-jdtls'},
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

use {
  "lukerry@git.amazon.com:pkg/NinjaHooks", -- Barium (Amazon specific)
  branch = "mainline",
  rtp = 'configuration/vim/amazon/brazil-config',
}

end)
