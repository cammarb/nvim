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
    vim.cmd('colorscheme catppuccin-mocha')
  end
}
