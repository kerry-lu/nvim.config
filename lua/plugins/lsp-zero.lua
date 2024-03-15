return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  },

  config = function()
    local lsp_zero = require('lsp-zero')

    -- bemol (Amazon specific)
    function bemol()
     local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory'})[1]
     local ws_folders_lsp = {}
     if bemol_dir then
      local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
      if file then

       for line in file:lines() do
        table.insert(ws_folders_lsp, line)
       end
       file:close()
      end
     end

     for _, line in ipairs(ws_folders_lsp) do
      vim.lsp.buf.add_workspace_folder(line)
     end

    end

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({buffer = bufnr})

      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({select = false}),
        }),
      })

      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
      vim.keymap.set("n", "gt", "<cmd>vsp<CR><C-w><C-l> | lua vim.lsp.buf.definition()<CR>", {})

      bemol()
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { "jdtls", "pyright", "clangd", "tsserver", "kotlin_language_server", "lua_ls" },
      handlers = {
        lsp_zero.default_setup,
        jdtls = lsp_zero.noop,
      }
    })

    -- CodeWhisperer (See https://code.amazon.com/packages/CWLS/trees/mainline for setup)
    lsp_zero.new_client({
      name = 'codewhisperer',
      cmd = { '/usr/local/bin/cwls' },
      filetypes = { 'java', 'python', 'typescript', 'javascript', 'csharp', 'ruby', 'kotlin', 'shell', 'sql', 'c', 'cpp', 'go', 'rust' },
      autostart = true,
      root_dir = function()
        return lsp_zero.dir.find_first({'Config'})
      end
    })
  end
}
