return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "<leader>t", require("grapple").toggle)
      vim.keymap.set("n", "<leader>pt", require("grapple").toggle_tags)
    end
}
