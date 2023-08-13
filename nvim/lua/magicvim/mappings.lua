local g = vim.g
local map = vim.keymap.set
local noremap = {noremp = true, silent = true}
local smap = {silent = true}

g.mapleader = ' '

--editing
map('v', '<a-up>', ':m .-2<cr>==')
map('v', '<a-down>', ':m .+1<cr>==')
map('x', '<a-up>', ":move '<-2<cr>gv-gv")
map('x', '<a-down>', ":move '>+1<cr>gv-gv")

--navigation
map('n', '<c-right>', '$')
map('n', '<c-left>', '^')
map('n', '<c-up>', 'gg')
map('n', '<c-down>', 'G')
map('n', '<a-left>', 'b')
map('n', '<a-right>', 'w')
map('n', '<leader>bn', '<cmd>bn<cr>')
map('n', '<leader>bp', '<cmd>bp<cr>')
map('n', '<leader>bk', '<cmd>bdelete<cr>')

--For Whichkey Mappings
--Normal Mode
map('n', "<leader>w", "<cmd>w<cr>", {desc= "Write"})
map('n', "<leader>q", "<cmd>q!<cr>", {desc= "Quit"})
map('n', '<leader>x', '<cmd>wq<cr>', {desc= 'Save & Quit'})
map('n', "<leader>r", "<cmd>Telescope oldfiles<cr>", {desc= "Open Recent Files"})
map('n', "<leader>f", "<cmd>RnvimrToggle<cr>", {desc= "Open Ranger"})
map('n', "<leader>u", "<cmd>UndotreeToggle<cr>", {desc= "Open Undo Tree"})
map('n', "<leader>s", "<cmd>so%<cr>", {desc= "Source THIS File"})
map('n', "<leader>T", "<cmd>ToggleTerm direction=float<cr>", {desc= "Floating Terminal"})
map('n', "<leader>F", "<cmd>NvimTreeFindFileToggle<cr>", {desc= "Open Nvim-Tree"})
map('n', "<leader>E", "<cmd>!chmod +x %<cr>", {desc= "Make THIS File Executable"})
map('n', "<leader>C", "<cmd>ColorizerToggle<cr>", {desc= "Show Colors in THIS File"})
map('n', "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {desc= "Search"})
map('n', "<leader>S", "<cmd>SudaWrite<cr>", {desc= "Write with Sudo"})
map('n', "<leader>h", "<cmd>HopWord<cr>", {desc= "Hop to a Word"})
map('n', "<leader>k", "<cmd>Legendary<cr>", {desc= "Search Key Maps"})
map('n', "<leader>y", "<cmd>Telescope yank_history<cr>", {desc= "Yank List"})
map('n', "<leader>'", "<Plug>(comment_toggle_linewise_current)", {desc= "Comment Out THIS Line"})
map('n', "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {desc= "Open LazyGit"})
map('n', "<leader>c", '"+y<cr>', {desc= "Copy"})
map('n', "<leader>p", '"+p<cr>', {desc= "Paste"})
map('n', "<leader>X", '<C-w>c<cr>', {desc= "Close Window"})
map('n', "<leader>a", 'ggVG', {desc= "Select ALL"})

--Visual Mode
map('v', "<leader>'", "<Plug>(comment_toggle_linewise_visual)", {desc= "Comment Out Selected Lines"})
map('v', "<leader>i", ":norm I", {desc= "Add Text to Start of Selected Lines"})
map('v', "<leader>a", ":norm A", {desc= "Add Text to End of Selected Lines"})
map('v', "<leader>c", '"+y<cr>', {desc= "Copy"})

--Telescope
map('n', "<leader>tf", "<cmd>Telescope find_files<cr>", {desc= "Find File" })
map('n', "<leader>tg", "<cmd>Telescope live_grep<cr>", {desc= "Live Grep"})
map('n', "<leader>td", "<cmd>Telescope diagnostics<cr>", {desc= "Diagnostics"})
map('n', "<leader>ts", "<cmd>Telescope spell_suggest<cr>", {desc= "Spelling"})
map('n', "<leader>tb", "<cmd>Telescope buffers<cr>", {desc= "Open Buffers"})
map('n', "<leader>tm", "<cmd>Telescope man_pages<cr>", {desc= "Find Man Pages"})
map('n', "<leader>tc", "<cmd>Telescope colorscheme<cr>", {desc= "Change Colorscheme"})
map('n', "<leader>tY", "<cmd>YankyClearHistory<cr>", {desc= "Clear Yank History"})
map('n', "<leader>th", "<cmd>Telescope help_tags<cr>", {desc= "Search Help Pages"})

--Packer
map('n', "<leader>Pi", "<cmd>PackerInstall<cr>", {desc= "Install Plugin"})
map('n', "<leader>Pu", "<cmd>PackerSync<cr>", {desc= "Update Plugins"})
map('n', "<leader>Pc", "<cmd>PackerClean<cr>", {desc= "Clean Up"})
map('n', "<leader>Pl", "<cmd>PackerStatus<cr>", {desc= "List Plugins"})

--LSP
map('n', "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", {desc= "Rename Buffer"})
map('n', "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", {desc= "Jump to Definition"})
map('n', "<leader>lh", "<cmd>lua vim.diagnostic.open_float()<cr>", {desc= "Diagnostics"})
map('n', "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>", {desc= "Next Diagnostic"})
map('n', "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {desc= "Previous Diagnostic"})
map('n', "<leader>lm", "<cmd>Mason<cr>", {desc= "Open Mason"})
map('n', "<leader>lu", "<cmd>MasonUpdate<cr>", {desc= "Update Mason(LSP)"})
map('n', "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", {desc= "Take Action"})

-- VimWiki

