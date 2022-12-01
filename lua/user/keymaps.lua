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
keymap("n", "<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy{previewer=false,show_line=false})<CR>", opts)

-- NvimTree
keymap("n", "<leader>fn", "<cmd>NvimTreeFindFile<CR>", opts)

-- Toggleterm
-- keymap("n", "<leader>t", ":ToggleTerm direction=float<CR>", opts)
keymap("t", "<esc>", "<C-\\><C-n>", opts)
keymap("t", "jk", "<C-\\><C-n>", opts)

