return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      --      transparent_background = false,
      --      flavour = "auto",
      --      background = { -- :h background
      --        light = "latte",
      --        dark = "mocha",
      --      },
    })
<<<<<<< HEAD
    --   vim.cmd('colorscheme catppuccin-mocha')
=======
    --    vim.cmd('colorscheme catppuccin')
>>>>>>> bfd1fee (Update remap)
  end
}
