local utils = require("utils")

local opts = { silent = true, noremap = true }

--  compe mappings
utils.map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
utils.map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
utils.map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
utils.map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
utils.map("i", "<CR>", "v:lua.completions()", { expr = true })

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them
--[[ remove this line

utils.map("n", "dd", [=[ "_dd ]=], opt)
utils.map("v", "dd", [=[ "_dd ]=], opt)
utils.map("v", "x", [=[ "_x ]=], opt)

 this line too ]]

-- Disable accidentally pressing ctrl-z and suspending
utils.map("n", "<c-z>", "<Nop>", opts)

-- Copy whole file content with Ctrl-a
utils.map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opts)

-- Save with Ctrl-s
utils.map("n", "<C-s>", ":w <CR>", opts)

-- Esc with jh
utils.map("i", "jk", "<esc>", {})
utils.map("v", "jk", "<esc>", {})

-- better indenting
utils.map("v", "<", "<gv", opts)
utils.map("v", ">", ">gv", opts)

-- use ESC to turn off search highlighting
utils.map("n", "<Esc>", ":noh<CR>", opts)

-- use ESC to turn off search highlighting
utils.map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Move selected line / block of text in visual mode
utils.map("x", "K", ":move '<-2<CR>gv-gv", opts)
utils.map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Don't copy the replaced text after pasting in visual mode
utils.map("v", "p", '"_dP', opts)

-- Commentary
utils.map("n", "<leader>/", ":CommentToggle<CR>", opts)
utils.map("v", "<leader>/", ":CommentToggle<CR>", opts)

-- better window movement
utils.map("n", "<C-h>", "<C-w>h", opts)
utils.map("n", "<C-j>", "<C-w>j", opts)
utils.map("n", "<C-k>", "<C-w>k", opts)
utils.map("n", "<C-l>", "<C-w>l", opts)

-- Windows and Splits
utils.map("n", "<leader>wc", "<C-W>c", opts) -- Close Split
utils.map("n", "<leader>ws", "<C-W>s", opts) -- Horizontal Split
utils.map("n", "<leader>wv", "<C-W>v", opts) -- Vertical Split
utils.map("n", "<leader>wl", "<C-W>5>", opts) -- Expand Split Right
utils.map("n", "<leader>wh", "<C-W>5<", opts) -- Expand Split left
utils.map("n", "<leader>wb", "<C-W>=", opts) --  Balance Splits
utils.map("n", "<leader>wj", ":resize -5<CR>", opts) -- Expand Split above
utils.map("n", "<leader>wk", ":resize +5<CR>", opts) -- Expand Split below

-- Buffers or Tabs
utils.map("n", "<leader>bn", ":enew<CR>", opts) -- New tab
utils.map("n", "<leader>bd", ":bd!<CR>", opts) -- Close tab
utils.map("n", "<TAB>", ":BufferLineCycleNext<CR>", opts) -- Next Tab
utils.map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts) -- Prev Tab
utils.map("n", "<leader>bp", ":BufferLinePick<CR>", opts) -- Pick a buffer or tab

-- Git
utils.map("n", "<leader>gg", ":LazyGit<CR>", opts) -- Open LazyGit
utils.map("n", "<leader>gc", ":Telescope git_commits<CR>", opts) -- Commits List
utils.map("n", "<leader>gC", ":Telescope git_bcommits<CR>", opts) -- Commits List for current file
utils.map("n", "<leader>gb", ":Telescope git_branches<CR>", opts) -- Branches List
utils.map("n", "<leader>gt", ":Telescope git_status<CR>", opts) -- Git status
utils.map("n", "<leader>gj", ":lua require 'gitsigns'.next_hunk()<CR>", opts) -- Next Hunk
utils.map("n", "<leader>gk", ":lua require 'gitsigns'.prev_hunk()<CR>", opts) -- Prev Hunk
utils.map("n", "<leader>gl", ":lua require 'gitsigns'.blame_line()<CR>", opts) -- Blame
utils.map("n", "<leader>gp", ":lua require 'gitsigns'.preview_hunk()<CR>", opts) -- Preview Hunk
utils.map("n", "<leader>gr", ":lua require 'gitsigns'.reset_hunk()<CR>", opts) -- Reset Hunk
utils.map("n", "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<CR>", opts) -- Reset Buffer
utils.map("n", "<leader>gs", ":lua require 'gitsigns'.stage_hunk()<CR>", opts) -- Stage Hunk
utils.map("n", "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<CR>", opts) -- Unstage Hunk

-- Help Telescope
utils.map("n", "<leader>hh", ":Telescope help_tags<CR>", opts) -- help_tags
utils.map("n", "<leader>ht", ":Telescope builitn<CR>", opts) -- builtins
utils.map("n", "<leader>hc", ":Telescope commands<CR>", opts) -- commands
utils.map("n", "<leader>hk", ":Telescope keymaps<CR>", opts) -- keymaps
utils.map("n", "<leader>ho", ":Telescope vim_options<CR>", opts) -- vim options
utils.map("n", "<leader>ha", ":Telescope autocommands<CR>", opts) -- autocommands

-- Code and LSP
utils.map("n", "<leader>ca", ":Lspsaga code_action<CR>", opts) -- Code actions
utils.map("n", "<leader>cr", ":Lspsaga rename<CR>", opts) -- Rename function
utils.map("n", "<leader>cf", ":Lspsaga lsp_finder<CR>", opts) -- Find references
utils.map("n", "<leader>cs", ":SymbolsOutline<CR>", opts) -- Code tree with symbols
utils.map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", opts) -- Preview definition
utils.map("n", "<leader>cF", ":Format<CR>", opts) -- Format buffer

utils.map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
utils.map("n", "<leader>cl", ":lua vim.lsp.diagnostic.set_loclist()<CR>", opts) -- error list
utils.map("n", "<leader>cgp", "lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
utils.map("n", "<leader>cgn", "lua vim.lsp.diagnostic.goto_next()<CR>", opts)
utils.map("n", "<leader>cgD", ":lua vim.lsp.buf.definition()<CR>", opts) -- gd: jump to definition
utils.map("n", "<leader>cgr", ":lua vim.lsp.buf.references()<CR>", opts) -- gr: go to reference
utils.map("n", "<leader>cgi", ":lua vim.lsp.buf.implementation()<CR>", opts) -- gi: buf implementation

-- Runner
utils.map("n", "<leader>ci", ':lua require("modules.runner").start_repl()<CR>', opts)

-- Plugins
utils.map("n", "<leader>pi", ":PackerInstall<CR>", opts)
utils.map("n", "<leader>ps", ":PackerSync<CR>", opts)
utils.map("n", "<leader>pc", ":PackerClean<CR>", opts)
utils.map("n", "<leader>pC", ":PackerCompile<CR>", opts)
utils.map("n", "<leader>pt", ":PackerStatus<CR>", opts)
utils.map("n", "<leader>pr", ":lua require('core.functions').reload_config()<CR>", opts)

-- Search
utils.map("n", "<leader>sg", ":Telescope live_grep<CR>", opts)
utils.map("n", "<leader>sb", ":Telescope current_buffer_fuzzy_find<CR>", opts)
utils.map("n", "<leader>ss", ":Telescope lsp_document_symbols<CR>", opts)
utils.map("n", "<leader>sh", ":Telescope command_history<CR>", opts)
utils.map("n", "<leader>sm", ":Telescope marks<CR>", opts)
