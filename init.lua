vim.g.mapleader = " "
vim.g.maplocleader = "\\"
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
-- Case-insensitive search (smartcase: uppercase forces case-sensitive)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Style
vim.cmd("colorscheme default")

-- Plugins
local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
	{ src = gh('neovim/nvim-lspconfig') },
        { src = gh('nvim-mini/mini.pick') },
        { src = gh('nvim-mini/mini.extra') },
        { src = gh('nvim-mini/mini.diff') },
})

-- Fzf, Search, Git
require('mini.pick').setup({})
require('mini.extra').setup({})
require('mini.diff').setup()

local map = function(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

-- Files
map('<leader>ff', function() MiniPick.builtin.files() end, 'Find files')
map('<leader>fg', function() MiniPick.builtin.grep_live() end, 'Live grep')
map('<leader>fb', function() MiniPick.builtin.buffers() end, 'Buffers')
map('<leader>fh', function() MiniPick.builtin.help() end, 'Help tags')
map('<leader>fr', function() MiniPick.builtin.resume() end, 'Resume last picker')

-- Git files
map('<leader>ft', function() MiniExtra.pickers.git_files({ scope = 'tracked' }) end, 'Git tracked files')
map('<leader>fm', function() MiniExtra.pickers.git_files({ scope = 'modified' }) end, 'Git modified files')
map('<leader>fu', function() MiniExtra.pickers.git_files({ scope = 'untracked' }) end, 'Git untracked files')
map('<leader>fs', function()
  MiniPick.builtin.cli(
    { command = { 'git', 'diff', '--cached', '--name-only' } },
    { source = { name = 'Git staged files' } }
  )
end, 'Git staged files')

-- Git hunks (preview shows the diff)
map('<leader>gh', function() MiniExtra.pickers.git_hunks({ scope = 'unstaged' }) end, 'Unstaged hunks')
map('<leader>gH', function() MiniExtra.pickers.git_hunks({ scope = 'staged' }) end, 'Staged hunks')

-- mini.diff overlay
map('<leader>go', function() MiniDiff.toggle_overlay(0) end, 'Toggle diff overlay')

-- LSP
vim.lsp.enable('lua_ls')
vim.lsp.enable('kotlin_lsp')
vim.lsp.enable('yamlls')
vim.lsp.enable('gh_actions_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('rust_analyzer')
-- vim.lsp.enable('texlab')
-- vim.lsp.enable('terraformls')

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Completion and formatting
vim.o.autocomplete = true
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Auto-format ("lint") on save.
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
vim.opt.complete:append('o')
