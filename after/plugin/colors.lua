-- colorscheme list
vim.g.lain_colorscheme = "SerialExperimentsLain"
vim.g.seoul256_colorscheme = "seoul256"

function ColorerizeMyVim()
    require("transparent").setup({
        extra_groups = { -- table/string: additional groups that should be cleared
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
    },
    })

    vim.cmd("colorscheme " .. vim.g.seoul256_colorscheme)
end

ColorerizeMyVim()
