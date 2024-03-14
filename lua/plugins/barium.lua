return {
  url = "<lukerry>@git.amazon.com:pkg/NinjaHooks",
  branch = "mainline",
  lazy = false,
  config = function(plugin)
    vim.opt.rtp:prepend(plugin.dir .. "/configuration/vim/amazon/brazil-config")
    -- Make my own filetype thing to override neovim applying ".conf" file type.
    -- You may or may not need this depending on your setup.
    vim.filetype.add({
      filename = {
        ['Config'] = function()
          vim.b.brazil_package_Config = 1
          return 'brazil-config'
        end,
      },
    })
  end,
}

