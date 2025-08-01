-- lua/config/plugins/mini.lua
return {
  {
    "echasnovski/mini.nvim",
    config = function()
<<<<<<< HEAD
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = false }
    end
  }
=======
      local icons = require("mini.icons")
      icons.setup({})
      local gitdiff = require("mini.diff")
      gitdiff.setup({})
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true })
    end,
  },
>>>>>>> 8a100b1 (update)
}
