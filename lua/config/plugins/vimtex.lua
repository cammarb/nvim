return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = 'evince'
      vim.g.vimtex_view_general_options = '--page-label=@line @pdf'
      vim.g.vimtex_compiler_latexmk = {
         aux_dir = 'aux_dir',
         out_dir = 'build',
        }
    end
  }
}
