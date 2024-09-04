return {
  'echasnovski/mini.nvim',
  version = 'false',
  config = function()
    require('mini.indentscope').setup()
    require('mini.comment').setup()
  end
}
