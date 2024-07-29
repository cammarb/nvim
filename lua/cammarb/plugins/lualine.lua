return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "ColorScheme",
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = false,
        section_separators = '',
        component_separators = '',
        theme = 'base16',
      }
    })
  end
}
