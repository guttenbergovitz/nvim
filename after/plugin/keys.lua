local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- paste over without yank
keymap("v", "p", '"_dP', default_opts)

-- move selected line / block of text in visual mode
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)

-- resizing splits
keymap("n", "<Left>", ":vertical resize +5<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -5<CR>", default_opts)
keymap("n", "<Up>", ":resize -2<CR>", default_opts)
keymap("n", "<Down>", ":resize +2<CR>", default_opts)

-- space keys for navigation
keymap("n", "<c-f>", ":Telescope find_files<CR>", default_opts)
keymap("n", "<c-e>", ":NvimTreeToggle<CR>", default_opts)
keymap("n", "<c-r>", ":Ranger<CR>", default_opts)
keymap("n", "<c-v>", ":Vifm<CR>", default_opts)

-- spacekeys for basic
keymap("n", "<c-s>", ":w<CR>", default_opts)
keymap("n", "<c-S>", ":w!<CR>", default_opts)
keymap("n", "<c-q>", ":q<CR>", default_opts)
keymap("n", "<c-Q>", ":q!<CR>", default_opts)
