vim.g.mapleader = ","

vim.keymap.set("n", "<leader>q", "<cmd>Oil<CR>") -- Open oil buffer

-- Split pane and navigation shortcuts
vim.keymap.set("n", "<leader>s", "<cmd>sp<CR><C-w><C-j>") -- horizontal split window
vim.keymap.set("n", "<leader>v", "<cmd>vsp<CR>") -- vertical split window
vim.keymap.set("n", "<leader>T", "<C-w>T") -- new tab
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

vim.keymap.set('v', 'p', 'P', { noremap = true }) -- paste without overwriting register

vim.keymap.set("n", "<Space>", "i<Space><Right><ESC>") -- insert space in normal mode with space bar

-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
