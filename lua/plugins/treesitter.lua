local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup {
        ensure_installed = Kv.treesitter.ensure_installed,
        ignore_installed = Kv.treesitter.ignore_install,
        highlight = Kv.treesitter.highlight,
        indent = {
          enable = true
        }
    }
end

return M
