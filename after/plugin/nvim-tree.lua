vim.g.nvim_tree_auto_ignore_ft = 'startify'

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    hijack_cursor = false,
    view = {
        width = 25,
        side = 'left',
    },
})
