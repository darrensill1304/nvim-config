local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

-- Split window and move to it
keymap("n", "<leader>wv", "<C-w>v<bar><C-w>l", opts)
keymap("n", "<leader>ws", "<C-w>s<bar><C-w>j", opts)

-- Close window
keymap("n", "<leader>wc", "<C-w>c", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)

-- Close buffer with leader-b-d (keep window split)
keymap("n", "<leader>bd", ":bp<bar>bd #<CR>", opts)

-- Clear Search Highlighting
keymap("n", "<leader>h", ":nohl<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

------------------------------------------------------
------------------- Plugin Mappings ------------------
------------------------------------------------------

-- Telescope
--keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy{previewer = false})<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
--keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy{previewer = false})<cr>", opts)

-- NvimTree
keymap("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>fn", "<cmd>NvimTreeFindFile<CR>", opts)

-- Toggleterm
keymap("n", "<leader>t", ":ToggleTerm direction=float<CR>", opts)
keymap("t", "<esc>", "<C-\\><C-n>", opts)
keymap("t", "jk", "<C-\\><C-n>", opts)

