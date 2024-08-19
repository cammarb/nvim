vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set("n", "<leader>ee", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>")
