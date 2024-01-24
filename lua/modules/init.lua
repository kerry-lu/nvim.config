require("modules.remap")
require("modules.packer")
require("modules.opts")

-- Remaps
vim.g.mapleader = ","
keymap_once("n", "<leader>q", "<cmd>Ex<CR>")

-- Split pane and navigation shortcuts
keymap_once("n", "<leader>s", "<cmd>sp<CR><C-w><C-j>")
keymap_once("n", "<leader>v", "<cmd>vsp<CR><C-w><C-l>")
keymap_once("n", "<C-h>", "<C-w><C-h>")
keymap_once("n", "<C-j>", "<C-w><C-j>")
keymap_once("n", "<C-k>", "<C-w><C-k>")
keymap_once("n", "<C-l>", "<C-w><C-l>")

keymap_once("n", "<leader>1", function()
  vim.api.nvim_command('vsplit')
  vim.api.nvim_command('wincmd l')
  vim.api.nvim_command('split')
  vim.api.nvim_command('wincmd h')
end)

-- paste without overwriting register
vim.api.nvim_set_keymap('v', 'p', 'P', { noremap = true })

-- Visual selection -> move one line up or down
keymap_once("v", "J", ":m'>+1<CR>gv=gv")
keymap_once("v", "K", ":m'<-2<CR>gv=gv")

-- Use xclip clipboard
vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ["+"] = 'xclip -selection clipboard',
    ["*"] = 'xclip -selection clipboard',
  },
  paste = {
    ["+"] = 'xclip -selection clipboard -o',
    ["*"] = 'xclip -selection clipboard -o',
  },
  cache_enabled = 1,
}

-- Remove trailing whitespace on disk write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
