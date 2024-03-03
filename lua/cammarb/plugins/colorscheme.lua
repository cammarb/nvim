return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local configs = require("catppuccin")
		configs.setup({
			transparent_background = false
		})
		vim.cmd.colorscheme "catppuccin"
	end
}
