return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      local is_wsl = vim.fn.has("unix") == 1 and vim.env.WSLENV ~= nil
      local is_win = vim.fn.has("win32") == 1
      -- PDF
      --vim.g.vimtex_view_method = "general"
      -- Windows (WSL)
      --vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
      --vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
      -- MacOS
      vim.g.vimtex_view_method = "sioyek"
      if is_win or is_wsl then
        vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
        vim.g.vimtex_callback_progpath = "wsl nvim"
      else
        vim.g.vimtex_view_sioyek_exe = "sioyek"
      end

      -- latexmk compiler
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_callback_enabled = 1
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "aux_dir",
        out_dir = "build",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-bibtex",
          "-pdf",
          "-auxdir=aux",
          "-outdir=build",
        },
      }
    end,
  },
}
