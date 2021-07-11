vim.g.mapleader = Sv.leader_key

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>",
                        {noremap = true, silent = true})

local M = {}

M.config = function()
    require("which-key").setup {
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20 -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true -- misc bindings to work with windows
            }
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = {
            d = 'Delete',
            c = 'Change',
            y = 'Yank (copy)',
            ['g~'] = 'Toggle case',
            ['gu'] = 'Lowercase',
            ['gU'] = 'Uppercase',
            ['>'] = 'Indent right',
            ['<lt>'] = 'Indent left',
            ['zf'] = 'Create fold',
            ['!'] = 'Filter though external program',
            -- ['v'] = 'Visual Character Mode',
            gc = 'Comments'
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+" -- symbol prepended to a group
        },
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
            padding = {2, 2, 2, 1} -- extra window padding [top, right, bottom, left]
        },
        layout = {
            height = {min = 4, max = 25}, -- min and max height of the columns
            width = {min = 20, max = 50}, -- min and max width of the columns
            spacing = 4 -- spacing between columns
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = {
            "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "
        }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = {"<leader>"} -- or specifiy a list manually
    }

    local mappings = {

        ["/"] = "Comment Toggle",
        ["w"] = {
            name = "+Windows",
            ["w"] = {"<C-W>p", "Other Window"},
            ["c"] = {"<C-W>c", "Close Uindow"},
            ["-"] = {"<C-W>s", "Split Horizontal"},
            ["|"] = {"<C-W>v", "Split Vertical"},
            ["h"] = {"<C-W>h", "Focus window-left"},
            ["j"] = {"<C-W>j", "Focus window-below"},
            ["l"] = {"<C-W>l", "Focus Window-right"},
            ["k"] = {"<C-W>k", "Focus Window-up"},
            ["H"] = {"<C-W>5<", "expand-window-left"},
            ["J"] = {":resize +5", "expand-window-below"},
            ["L"] = {"<C-W>5>", "expand-window-right"},
            ["K"] = {":resize -5", "expand-window-up"},
            ["="] = {"<C-W>=", "balance-window"},
            ["s"] = {"<C-W>s", "split-window-below"},
            ["v"] = {"<C-W>v", "split-window-right"}
        },
        b = {
            name = "+Buffer",
            ["b"] = {"<cmd>:e #<cr>", "Switch to Other Buffer"},
            ["p"] = {"<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer"},
            ["["] = {"<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer"},
            ["n"] = {"<cmd>:BufferLineCycleNext<CR>", "Next Buffer"},
            ["]"] = {"<cmd>:BufferLineCycleNext<CR>", "Next Buffer"},
            ["d"] = {"<cmd>:bd<CR>", "Close Buffer"},
            ["g"] = {"<cmd>:BufferLinePick<CR>", "Goto Buffer"}
        },
        g = {
            name = "+Git",
            c = {"<Cmd>Telescope git_commits<CR>", "commits"},
            b = {"<Cmd>Telescope git_branches<CR>", "branches"},
            s = {"<Cmd>Telescope git_status<CR>", "status"}
        },
        ["h"] = {
            name = "+Help",
            r = {
                "<cmd>lua require('utils').reload_config()<cr>", "Reload Config"
            },
            t = {"<cmd>:Telescope builtin<cr>", "Telescope Builtins"},
            c = {"<cmd>:Telescope commands<cr>", "Commands"},
            h = {"<cmd>:Telescope help_tags<cr>", "Help Pages"},
            m = {"<cmd>:Telescope man_pages<cr>", "Man Pages"},
            k = {"<cmd>:Telescope keymaps<cr>", "Key Maps"},
            s = {"<cmd>:Telescope highlights<cr>", "Search Highlight Groups"},
            f = {"<cmd>:Telescope filetypes<cr>", "File Types"},
            o = {"<cmd>:Telescope vim_options<cr>", "Options"},
            a = {"<cmd>:Telescope autocommands<cr>", "Auto Commands"}
        },

        ["p"] = {
            name = "+Packer",
            i = {"<cmd>PackerInstall<cr>", "Install"},
            s = {"<cmd>PackerSync<cr>", "Sync"},
            r = {"<cmd>PackerCompile<cr>", "Compile"},
            c = {"<cmd>PackerClean<cr>", "Clean"},
            t = {"<cmd>PackerStatus<cr>", "Status"}
        },
        ["s"] = {
            name = "+Search",
            g = {"<cmd>Telescope live_grep<cr>", "Grep"},
            b = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer"},
            s = {"<cmd>Telescope lsp_document_symbols<cr>", "Goto Symbol"},
            h = {"<cmd>Telescope command_history<cr>", "Command History"},
            m = {"<cmd>Telescope marks<cr>", "Jump to Mark"},
            r = {"<cmd>lua require('spectre').open()<CR>", "Replace (Spectre)"}
        },
        f = {
            name = "+Telescope",
            f = {"<cmd>Telescope find_files<cr>", "Find File"},
            o = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
            d = {":Telescope file_browser<cr>", "Browse Files"},
            s = {"<cmd>Telescope live_grep<cr>", "Search Word"},
            b = {"<cmd>Telescope marks<cr>", "Search Word"},
            m = {"<cmd>Neoformat<cr>", "Format File"},
            n = {"<cmd>enew<cr>", "New File"}

        },
        [":"] = {"<cmd>Telescope command_history<cr>", "Command History"},
        q = {
            name = "+Quit/Session",
            q = {"<cmd>:qa<cr>", "Quit"},
            ["!"] = {"<cmd>:qa!<cr>", "Quit without saving"},
            s = {"<cmd>SessionSave<cr>", "Save Session"},
            l = {"<cmd>SessionLoad<cr>", "Session Load"}
        },
        x = {
            name = "+errors",
            l = {"<cmd>lopen<cr>", "Open Location List"},
            q = {"<cmd>copen<cr>", "Open Quickfix List"}
        },
        z = {
            name = "+Zen",
            z = {"<cmd>TZAtaraxis<cr>", "Atraxis Mode"},
            m = {"<cmd>TZMinimalist<cr>", "Minimalist Mode"},
            f = {"<cmd>TZFocus<cr>", "Focus Mode"}
        },

        e = {"<cmd>NvimTreeToggle<cr>", "Nvim Tree"}
    }

    for i = 0, 10 do mappings[tostring(i)] = "which_key_ignore" end

    for k, v in pairs(Sv.user_which_key) do mappings[k] = v end

    local wk = require("which-key")

    wk.register(mappings, {prefix = "<leader>"})

    -- wk.register({g = {name = "+goto", h = "Hop Word"}, s = "Hop Word1"})

end

return M
