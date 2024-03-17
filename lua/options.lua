-- [[ Setting options ]]
-- See `:help vim.o`

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.wrap = false

-- tell Neovim we have a nerd font
vim.g.have_nerd_font = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Mode in status line, dont need to show
vim.opt.showmode = false

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- show line which cursor is on
vim.opt.cursorline = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Split windows down and right 
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Make sure we get good colours
vim.o.termguicolors = true

-- Disable auto comment on enter
vim.opt.formatoptions = 'ct'
vim.opt_local.formatoptions = 'ct'
-- vim.opt_local.formatoptions = vim.opt.formatoptions + 'o' + 'r'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
