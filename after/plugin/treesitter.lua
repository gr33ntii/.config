require'nvim-treesitter.configs'.setup {
    -- this bitch slow af
    -- ensure_installed = "all",
    -- prefer_git = true,
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

