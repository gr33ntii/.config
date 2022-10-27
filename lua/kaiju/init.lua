require("kaiju.plugins")
require("kaiju.base")

local augroup = vim.api.nvim_create_augroup
KaijuGroup = augroup('Kaiju', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end


autocmd('BufEnter', {
    group = KaijuGroup,
    pattern = "*",
    command = "silent! lcd %:p:h"
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = KaijuGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = KaijuGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

autocmd({"VimEnter"}, {
  callback = function()
    local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
    vim.defer_fn(function() vim.loop.kill(pid, WINCH) end, 20)
  end
})
