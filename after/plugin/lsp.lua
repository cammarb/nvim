local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Ensure it is installed
lsp.ensure_installed({
  'tsservesr',
  'eslint',
  'rust_analyzer',
  'pyright',
})

lsp.setup()
