-- colorscheme list
vim.g.lain_colorscheme = "SerialExperimentsLain"
vim.g.seoul256_colorscheme = "seoul256"

function ColorerizeMyVim()
    require("transparent").setup({
        enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be cleared
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
    },
    exclude = {}, -- table: groups you don't want to clear
    })

    vim.cmd("colorscheme " .. vim.g.seoul256_colorscheme)
end

ColorerizeMyVim()
