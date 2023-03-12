-- Set Leader
vim.g.mapleader = " "
local keymap = vim.keymap

-- Enter explore
keymap.set("n", "<leader>e", vim.cmd.Ex)

-- General Maps
keymap.set("i", "kj", "<ESC>")

keymap.set("n", "<leader>nh", ":noh<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make widths equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Tab Management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- New Tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- Close Tab
keymap.set("n", "<leader>tl", ":tabn<CR>") -- Next (right) tab
keymap.set("n", "<leader>th", ":tabp<CR>") -- Previous (left) tab

-- Pluggin Mappings
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- vim-maximizer
