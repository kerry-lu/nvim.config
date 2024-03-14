-- Colors
vim.opt.background = "dark"
vim.cmd([[colorscheme tokyonight-moon]])

-- Display relative and absolute line number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Amazon specific
vim.filetype.add({ filename = { Config = "brazil-config" } })
