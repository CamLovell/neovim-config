-- recommended from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    hijack_netrw = true,
    hijack_directories = {
        enable = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            }
        }
    }
})
