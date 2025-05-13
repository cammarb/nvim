require("config.lazy")

local set = vim.opt

set.shiftwidth = 2
set.expandtab = true
set.number = true
set.relativenumber = true

vim.opt.termguicolors = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

vim.api.nvim_create_autocmd({"VimEnter", "VimResume"}, {
  callback = function()
    vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon0"
  end
})

vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
  callback = function()
    vim.opt.guicursor = "a:ver25-blinkon250"
  end
})

