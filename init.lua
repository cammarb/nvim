local global = vim.g
local opt = vim.opt
local keymap = vim.keymap
local api = vim.api

global.mapleader = " "
global.maplocleader = "\\"

opt.shiftwidth = 2
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.swapfile = false
opt.winborder = "rounded"

-- Recover terminal's cursor type
api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  callback = function()
    opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon0"
  end,
})

api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  callback = function()
    opt.guicursor = "a:ver25-blinkon250"
  end,
})

keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
keymap.set("n", "<leader>w", ":write<CR>")
keymap.set("n", "<leader>q", ":quit<CR>")

require("config.lazy")
<<<<<<< HEAD
<<<<<<< HEAD

-- Autocompletion and linting
api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('my.lsp', {}),
=======

-- Autocompletion and linting
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
>>>>>>> d566810 (add autoformat and linting)
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
<<<<<<< HEAD
      lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
=======
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
>>>>>>> d566810 (add autoformat and linting)
    end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
<<<<<<< HEAD
      api.nvim_create_autocmd('BufWritePre', {
        group = api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
=======
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
>>>>>>> d566810 (add autoformat and linting)
        end,
      })
    end
  end,
})
<<<<<<< HEAD
=======
>>>>>>> 8a100b1 (update)
=======
>>>>>>> d566810 (add autoformat and linting)
