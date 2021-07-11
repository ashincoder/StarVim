local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup {
        ensure_installed = Sv.treesitter.ensure_installed,
        ignore_installed = Sv.treesitter.ignore_install,
        highlight = Sv.treesitter.highlight,
        indent = {
          enable = true
        }
    }
end

return M
