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
utils.map("n", "<C-a>", "<Cmd>%y+<CR>", opts)

-- Save with Ctrl-s
utils.map("n", "<C-s>", "<cmd>w <CR>", opts)

-- better indenting
utils.map("v", "<", "<gv", opts)
utils.map("v", ">", ">gv", opts)

-- use ESC to turn off search highlighting
utils.map("n", "<Esc>", "<cmd>noh<CR>", opts)

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
utils.map("n", "<leader>wj", "<cmd>resize -5<CR>", opts) -- Expand Split above
utils.map("n", "<leader>wk", "<cmd>resize +5<CR>", opts) -- Expand Split below

-- Buffers or Tabs
utils.map("n", "<leader>bn", "<cmd>enew<CR>", opts) -- New tab
utils.map("n", "<leader>bd", "<cmd>bd!<CR>", opts) -- Close tab
utils.map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", opts) -- Pick a buffer or tab
utils.map("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", opts) -- Next Tab
utils.map("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", opts) -- Prev Tab

-- Git
utils.map("n", "<leader>gg", "<cmd>LazyGit<CR>", opts) -- Open LazyGit
utils.map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts) -- Commits List
utils.map("n", "<leader>gC", "<cmd>Telescope git_bcommits<CR>", opts) -- Commits List for current file
utils.map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts) -- Branches List
utils.map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts) -- Git status
utils.map("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", opts) -- Next Hunk
utils.map("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", opts) -- Prev Hunk
utils.map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<CR>", opts) -- Blame
utils.map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", opts) -- Preview Hunk
utils.map("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", opts) -- Reset Hunk
utils.map("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", opts) -- Reset Buffer
utils.map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", opts) -- Stage Hunk
utils.map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", opts) -- Unstage Hunk

-- Help Telescope
utils.map("n", "<leader>hh", "<cmd>Telescope help_tags<CR>", opts) -- help_tags
utils.map("n", "<leader>ht", "<cmd>Telescope builitn<CR>", opts) -- builtins
utils.map("n", "<leader>hc", "<cmd>Telescope commands<CR>", opts) -- commands
utils.map("n", "<leader>hk", "<cmd>Telescope keymaps<CR>", opts) -- keymaps
utils.map("n", "<leader>ho", "<cmd>Telescope vim_options<CR>", opts) -- vim options
utils.map("n", "<leader>ha", "<cmd>Telescope autocommands<CR>", opts) -- autocommands

-- Code and LSP --
-- Lsp Saga
utils.map("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", opts) -- Rename function
utils.map("n", "<leader>cf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- Find references
utils.map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- Code actions
utils.map("n", "<leader>cgn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
utils.map("n", "<leader>cgp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
-- Code
utils.map("n", "<leader>cs", "<cmd>SymbolsOutline<CR>", opts) -- Code tree with symbols
utils.map("n", "<leader>cd", "<cmd>Lspsaga preview_definition<CR>", opts) -- Preview definition
utils.map("n", "<leader>cF", "<cmd>Format<CR>", opts) -- Format buffer

utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
utils.map("n", "<leader>cl", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts) -- error list
utils.map("n", "<C-n>", "<cmd>lnext<CR>", opts) -- error navigation list
utils.map("n", "<C-p>", "<cmd>lprev<CR>", opts) -- error navigation list
utils.map("n", "<leader>cgD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- jump to definition
utils.map("n", "<leader>cgr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- go to reference
utils.map("n", "<leader>cgi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- buf implementation

-- Runner
utils.map("n", "<leader>ci", '<cmd>lua require("modules.runner").start_repl()<CR>', opts)

-- Plugins
utils.map("n", "<leader>pi", "<cmd>PackerInstall<CR>", opts)
utils.map("n", "<leader>ps", "<cmd>PackerSync<CR>", opts)
utils.map("n", "<leader>pc", "<cmd>PackerClean<CR>", opts)
utils.map("n", "<leader>pC", "<cmd>PackerCompile<CR>", opts)
utils.map("n", "<leader>pt", "<cmd>PackerStatus<CR>", opts)
utils.map("n", "<leader>pr", "<cmd>lua require('core.functions').reload_config()<CR>", opts)

-- Search
utils.map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", opts)
utils.map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
utils.map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", opts)
utils.map("n", "<leader>sh", "<cmd>Telescope command_history<CR>", opts)
utils.map("n", "<leader>sm", "<cmd>Telescope marks<CR>", opts)

-- Files
utils.map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
utils.map("n", "<leader>fm", "<cmd>Telescope media_files<CR>", opts)
utils.map("n", "<leader>fc", "<cmd>lua require('core.functions').search_dotfiles()<cr>", opts)
utils.map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts)
utils.map("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", opts)
utils.map("n", "<leader>fn", "<cmd>enew<CR>", opts)
utils.map("n", "<leader>ft", "<cmd>Format<CR>", opts)
utils.map("n", "<leader>:", "<cmd>Telescope command_history<CR>", opts)

-- Sessions
utils.map("n", "<leader>qq", "<cmd>wqa<CR>", opts)
utils.map("n", "<leader>q!", "<cmd>qa!<CR>", opts)
utils.map("n", "<leader>qs", "<cmd>SessionSave<CR>", opts)
utils.map("n", "<leader>ql", "<cmd>SessionLoad<CR>", opts)

-- Terminal
utils.map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", opts)
utils.map("n", "<leader>ts", "<cmd>10new +terminal | setlocal nobuflisted <CR>", opts)
utils.map("n", "<leader>tv", "<cmd>vnew +terminal | setlocal nobuflisted<CR>", opts)

-- Nvim Tree
utils.map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Zen Mode
utils.map("n", "<leader>zz", "<cmd>TZAtaraxis<CR>", opts)
utils.map("n", "<leader>zm", "<cmd>TZMinimalist<CR>", opts)
utils.map("n", "<leader>zf", "<cmd>TZFocus<CR>", opts)
