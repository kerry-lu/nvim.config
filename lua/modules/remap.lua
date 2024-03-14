vim.g.mapleader = ","
vim.keymap.set("n", "<leader>q", "<cmd>Ex<CR>")

-- Split pane and navigation shortcuts
vim.keymap.set("n", "<leader>s", "<cmd>sp<CR><C-w><C-j>")
vim.keymap.set("n", "<leader>v", "<cmd>vsp<CR><C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- paste without overwriting register
vim.keymap.set('v', 'p', 'P', { noremap = true })

-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
