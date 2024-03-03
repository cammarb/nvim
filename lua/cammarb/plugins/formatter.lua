return {
  'stevearc/conform.nvim',
	config = function ()
		local configs = require('conform')
		configs.setup({
			formatters_by_ft = {
    		javascript = { "prettier" },
				typescript = { "prettier" },
				prisma = { "prismals" }
  		},
			format_on_save = {
    		-- These options will be passed to conform.format()
    		timeout_ms = 500,
    		lsp_fallback = true,
 		 	}
		})
	end
}
