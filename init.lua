vim.g.mapleader = " "
vim.g.maplocleader = "\\"
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Style
vim.cmd.colorscheme("default")
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })

-- Plugins
local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
  { src = gh('neovim/nvim-lspconfig') },
  { src = gh('nvim-mini/mini.nvim') },
})

-- Files and Git search
require('mini.diff').setup()
require('mini.pick').setup()
require('mini.extra').setup()

local pick = MiniPick.builtin
local extra = MiniExtra.pickers

vim.keymap.set('n', '<leader>ff', pick.files)
vim.keymap.set('n', '<leader>fg', pick.grep_live)
vim.keymap.set('n', '<leader>fb', pick.buffers)
vim.keymap.set('n', '<leader>fr', pick.resume)

vim.keymap.set('n', '<leader>gs', function() extra.git_files({ scope = 'modified' }) end)
vim.keymap.set('n', '<leader>gc', extra.git_commits)
vim.keymap.set('n', '<leader>gb', function() extra.git_branches({ scope = 'all' }) end)

local function git_diff_picker(name, key, diff_args)
  local function command(args)
    local result = { 'git', 'diff' }
    vim.list_extend(result, diff_args)
    vim.list_extend(result, args)
    return result
  end

  vim.keymap.set('n', key, function()
    pick.cli(
      { command = command({ '--name-status' }) },
      {
        source = {
          name = name,
          preview = function(buf_id, item)
            local file = type(item) == 'table' and item.text or item
            if not file or file == '' then return end

            local result = vim.system(
              command({ '--no-ext-diff', '--', file }),
              { text = true }
            ):wait()

            local lines = vim.split(result.stdout or '', '\n', { plain = true })

            vim.bo[buf_id].modifiable = true
            vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
            vim.bo[buf_id].filetype = 'diff'
            vim.bo[buf_id].modifiable = false
          end,
        },
      }
    )
  end, { desc = name })
end

git_diff_picker('Staged files', '<leader>gs', { '--staged' })
git_diff_picker('Unstaged files', '<leader>gu', {})

-- LSP
vim.filetype.add({
  pattern = {
    [".*/%.github/workflows/.*%.ya?ml"] = "yaml.ghactions",
    ['.*compose.*%.ya?ml'] = 'yaml.docker-compose',
  },
})
vim.lsp.config('yamlls', {
  filetypes = { 'yaml' },
})


vim.lsp.enable('lua_ls')
vim.lsp.enable('kotlin_lsp')
vim.lsp.enable('lemminx')
vim.lsp.enable('yamlls')
vim.lsp.enable('actionsls')
vim.lsp.enable('docker_language_server')
vim.lsp.enable('jsonls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('terraformls')
vim.lsp.enable('bashls')
-- vim.lsp.enable('texlab')

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
