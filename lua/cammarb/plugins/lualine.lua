return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "ColorScheme",
  config = function()
    require('lualine').setup({
      icons_enabled = true,
      theme = 'auto',
    })
  end
}
