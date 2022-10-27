vim.g.kaiju_colorscheme = "SerialExperimentsLain"

require("transparent").setup({
    enable = true, -- boolean: enable transparent
    extra_groups = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

function setColorscheme()
    vim.opt.background = dark

    vim.cmd("colorscheme " .. vim.g.kaiju_colorscheme)

end

setColorscheme()
