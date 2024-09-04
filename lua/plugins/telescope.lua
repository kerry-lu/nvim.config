return {
  'nvim-telescope/telescope.nvim', version = '0.1.4',
  dependencies = { {'nvim-lua/plenary.nvim'} },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

    require('telescope').setup {
      defaults = {
        vimgrep_arguments = {
          "rg",              -- Use ripgrep
          "--follow",        -- Follow symbolic links
          "--no-heading",    -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search
          "--fixed-strings", -- Allow special characters by disabling regex
        }
      }
    }
  end
}
