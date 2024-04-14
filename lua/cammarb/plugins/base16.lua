return {
  "RRethy/base16-nvim",
  name = "base16-colorscheme",
  config = function()
    require("base16-colorscheme").with_config({})
    vim.cmd("colorscheme base16-default-dark")
  end
}
