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
