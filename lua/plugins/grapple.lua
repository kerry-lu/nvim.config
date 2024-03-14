return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "nvim-lualine/lualine.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>t", require("grapple").toggle)
      vim.keymap.set("n", "<leader>pt", require("grapple").toggle_tags)

      require("lualine").setup({
          sections = {
              lualine_b = {
                  {
                      require("grapple").statusline,
                      cond = require("grapple").exists
                  }
              }
          }
      })
    end
}
