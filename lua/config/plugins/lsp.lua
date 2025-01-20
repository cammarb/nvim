return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "kotlin_language_server",
          "bashls",
        },
        automatic_installation = true,
      })

      -- After setting up mason-lspconfig you may set up servers via lspconfig
      require("lspconfig").rust_analyzer.setup({})
      require("lspconfig").lua_ls.setup({})
    end,
  },
}
