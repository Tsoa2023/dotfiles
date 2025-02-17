local plugins = {
  -- Other plugins...
  {
    "glepnir/galaxyline.nvim",
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('custom.galaxyline')
    end,
  },
}

return plugins

