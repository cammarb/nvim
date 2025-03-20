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
      local languages =
        {
          "lua_ls",
          "rust_analyzer",
          "kotlin_language_server",
          "bashls",
          "yamlls",
        }, require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = languages,
        automatic_installation = true,
      })

      -- After setting up mason-lspconfig you may set up servers via lspconfig
      -- require("lspconfig").rust_analyzer.setup({})
      -- require("lspconfig").lua_ls.setup({})
      for _, language in ipairs(languages) do
        if language == "bashls" then
          require("lspconfig")[language].setup({
            settings = {},
          })
        else
          require("lspconfig")[language].setup({})
        end
      end
    end,
  },
}
