-- Colors
vim.opt.background = "dark"
vim.cmd([[colorscheme tokyonight-moon]])

-- Display relative line number
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, 'LineNr', { fg = "green" })

-- set textwidth to 119 characters and highlight the column one to the right
vim.opt.textwidth = 119
vim.opt.colorcolumn = "+1"

vim.opt.swapfile = false -- Don't use swapfile

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Ignore case letters when search

vim.opt.splitright = true -- split window to the right

-- Amazon specific
vim.filetype.add({ filename = { Config = "brazil-config" } })
