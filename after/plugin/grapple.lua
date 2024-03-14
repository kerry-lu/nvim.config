require("grapple")

vim.keymap.set("n", "<leader>t", require("grapple").tag)
vim.keymap.set("n", "<leader>u", require("grapple").untag)
vim.keymap.set("n", "<leader>pt", require("grapple").toggle_tags)

local grapple_msg = function()
  return "Tag [" .. require("grapple").key() .. "]"
end

require("lualine").setup({
    sections = {
        lualine_x = {
            {
                grapple_msg,
                cond = require("grapple").exists
            }
        }
    }
})
