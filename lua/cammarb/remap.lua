vim.g.mapleader = " "
vim.keymap.set("n", "<leader> E", vim.cmd.Ex)

vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>")
