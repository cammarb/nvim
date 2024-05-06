return {
  "HoNamDuong/hybrid.nvim",
  name = "hybrid",
  priority = 1000,
  config = function()
    require("hybrid").setup({
    })
    --    vim.cmd('colorscheme hybrid')
  end
}
