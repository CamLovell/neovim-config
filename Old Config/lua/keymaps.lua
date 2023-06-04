-- Set Leader
vim.g.mapleader = " "
local keymap = vim.keymap

-- General Maps
keymap.set("i", "kj", "<ESC>")

keymap.set("n", "<leader>nh", ":noh<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n","<leader>w", ":w<CR>")
keymap.set("n","<leader>q", ":q<CR>")
--keymap.set("n","<leader>wq", ":wq<CR>")

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make widths equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<C-h>", "<C-w>h") -- Better navigation
keymap.set("n", "<C-l>", "<C-w>l") -- Better navigation
keymap.set("n", "<C-j>", "<C-w>j") -- Better navigation
keymap.set("n", "<C-k>", "<C-w>k") -- Better navigation

-- Tab Management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- New Tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- Close Tab
keymap.set("n", "<leader>l", ":tabn<CR>") -- Next (right) tab
keymap.set("n", "<leader>h", ":tabp<CR>") -- Previous (left) tab

-- Pluggin Mappings
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- vim-maximizer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- nvim tree
