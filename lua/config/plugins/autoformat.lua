return {
  {
    "stevearc/conform.nvim",
    config = function()
      local formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "biome" },
        kotlin = { "ktlint" },
        rust = { "rustfmt" },
        yaml = { "yamlfmt" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        python = { "black" },
      }
      require("conform").setup({
        formatters_by_ft = formatters_by_ft,
        formatters = {
          yamlfmt = {
            command = "yamlfmt",
            args = { "-formatter eof_newline=true" },
            stdin = false,
          },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
