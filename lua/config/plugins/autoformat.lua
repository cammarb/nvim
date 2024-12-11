return {
  {
    "stevearc/conform.nvim",
    config = function()
      local formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome" },
        typescript = { "biome" },
        kotlin = { "ktlint" },
        python = { "black" },
      }

      require("conform").setup({
        formatters_by_ft = formatters_by_ft,
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
