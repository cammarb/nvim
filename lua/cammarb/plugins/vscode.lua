return {
    'Mofiqul/vscode.nvim',
    config = function()
    local c = require('vscode.colors').get_colors()
        local configs = require('vscode')
        configs.setup({
            transparent = true,
      })
        configs.load()
    end
}