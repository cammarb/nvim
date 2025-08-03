return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config['luals'] = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            }
          }
        }
      }
      vim.lsp.config['kotlin_lsp'] = {
        cmd = { 'kotlin-lsp' },
        filetypes = { 'kt' },
      }
    end,
  },
}
