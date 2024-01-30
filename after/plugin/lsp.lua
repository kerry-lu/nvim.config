require("modules/remap")

-- Setup language servers.
local lspconfig = require('lspconfig')
-- Global mappings.

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- Overrides defaults
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

-- Amazon specific
-- bemol
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

local on_attach = function(_, bufnr)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
  bemol()
end

require('mason').setup({})
require("mason-lspconfig").setup {
    ensure_installed = { "jdtls", "pyright", "clangd", "tsserver", "kotlin_language_server", "lua_ls" },
    handlers = {
      function(server)
        lspconfig[server].setup({
            on_attach = on_attach,
        })
      end,
    }
}

-- Amazon specific
-- Barium
local configs = require 'lspconfig.configs'

-- Check if the config is already defined (useful when reloading this file)
if not configs.barium then
    configs.barium = {
        default_config = {
            cmd = {'barium'};
            filetypes = {'brazil-config'};
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname)
            end;
            settings = {};
        };
    }
end

lspconfig.barium.setup {}
