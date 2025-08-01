-- lua/config/plugins/mini.lua
return {
  {
    "echasnovski/mini.nvim",
    config = function()
      local icons = require("mini.icons")
      icons.setup({})
      local gitdiff = require("mini.diff")
      gitdiff.setup({})
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true })
    end,
  },
}
