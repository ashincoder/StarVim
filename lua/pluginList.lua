local packer = require("packer")

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end
    },
    git = {
        clone_timeout = 600 -- Timeout, in seconds, for git clones
    }
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "akinsho/nvim-bufferline.lua",
        config = function() require("plugins.bufferline").config() end,
        event = "BufWinEnter"
    }

    use {
        "hoob3rt/lualine.nvim",
        config = function() require("plugins.lualine").config() end,
        event = "BufWinEnter"
    }

    -- color related stuff
    use {
        {"rafamadriz/neon", as = "neon"},
        {"folke/tokyonight.nvim", as = "tokyonight"},
        {"navarasu/onedark.nvim", as = "onedark"}
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("colorizer").setup()
            vim.cmd("ColorizerReloadAllBuffers")
        end
    }

    -- language related plugins
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function() require("plugins.treesitter").config() end
    }

    use {
        "kabouzeid/nvim-lspinstall",
        module = "lspinstall"
    }

    use {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        requires = {"ray-x/lsp_signature.nvim"},
        config = function() require("plugins.lspconfig").config() end
    }

    use {
        "onsails/lspkind-nvim",
        event = "BufRead",
        config = function() require("lspkind").init() end
    }

    -- load compe in insert mode only
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function() require("plugins.compe").config() end,
        wants = {"LuaSnip"},
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require("plugins.compe").snippets()
                end
            }, "rafamadriz/friendly-snippets",
               event = "InsertCharPre"
        }
    }

    use {"sbdchd/neoformat", cmd = "Neoformat"}

    -- file managing , picker etc
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function() require("plugins.nvimtree").config() end
    }

    use {
        "kyazdani42/nvim-web-devicons",
        config = function() require("plugins.icons").config() end
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim", module = "popup"},
            {"nvim-lua/plenary.nvim", module = "plenary"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
        },
        cmd = "Telescope",
        config = function() require("plugins.telescope").config() end
    }

    -- git stuff
    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function() require("plugins.gitsigns").config() end
    }

    -- misc plugins

    use {
        "folke/which-key.nvim",
        keys = "<space>",
        config = function() require("plugins.whichkey").config() end
    }

    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("nvim-autopairs").setup()
            require("nvim-autopairs.completion.compe").setup({
                map_cr = true,
                map_complete = true -- insert () func completion
            })
        end
    }

    use {"andymass/vim-matchup", event = "CursorMoved"}

    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function() require("nvim_comment").setup() end
    }

    use {
        "glepnir/dashboard-nvim",
        config = function() require("plugins.dashboard").config() end
    }

    use {"tweekmonster/startuptime.vim", cmd = "StartupTime"}

    -- load autosave only if its globally enabled
    use {
        "Pocco81/AutoSave.nvim",
        config = function() require("plugins.zenmode").autoSave() end,
        cond = function() return vim.g.auto_save == Sv.autosave end
    }

    -- smooth scroll
    use {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function() require("neoscroll").setup() end
    }

    use {
        "Pocco81/TrueZen.nvim",
        cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
        config = function() require("plugins.zenmode").config() end
    }

    --   use "alvan/vim-closetag" -- for html autoclosing tag

    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function() require("utils").blankline() end
    }

    for _, plugin in pairs(Sv.user_plugins) do packer.use(plugin) end
end
)
