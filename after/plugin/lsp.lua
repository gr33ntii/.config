local Remap = require("kaiju.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- Language Protocol Server
-- Settings
local sumneko_root_path = "C:\\Users\\Hackv\\AppData\\Local\\nvim-data\\sumneko"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server.exe"

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
    buffer = "[Buffer]",
    cmp_tabnine = "[TabNine]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]",
}

local symbol_mapping = {
      Text = "ﾃ",
      Method = "あ",
      Function = "",
      Constructor = "コ",
      Field = "ｷ",
      Variable = "ｱ",
      Class = "カ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "け",
      Snippet = "ホ",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
}


cmp.setup({
    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete()
    }),

    formatting = {
        format = function(entry, vim_item)
            local menu = source_mapping[entry.source.name]
            local symbol = symbol_mapping[vim_item.kind]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
            end
            vim_item.menu = menu
            vim_item.kind = symbol
            return vim_item
        end,
    },

    sources = {
        { name = "cmp_tabnine" },

        { name = "nvim_lsp" },

        -- { name = 'vsnip' },
        -- For luasnip user.
        { name = "luasnip" },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = "buffer" },

    },

    experimental = {
        -- Disable Ghost Text cause i dont like it
        --  ghost_text = true,
    }
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = function()
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("K", function() vim.lsp.buf.hover() end)
            nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
            nnoremap("[d", function() vim.diagnostic.goto_next() end)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end)
            nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
            nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                    filter = function(code_action)
                        if not code_action or not code_action.data then
                            return false
                        end

                        local data = code_action.data.id
                        return string.sub(data, #data - 1, #data) == ":0"
                    end,
                    apply = true
                })
            end)
            nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
            nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
        end,
    }, _config or {})
end

-- Load mason file
require("mason").setup()

require("lspconfig").intelephense.setup({

    filetype = {"php", "*.module"},

})

require("lspconfig").tsserver.setup(config())

require("lspconfig").gopls.setup(config({
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))

require("lspconfig").zls.setup(config())

-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    --[[
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
    --]]
}))

require("lspconfig").sumneko_lua.setup(config({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}

-- I dont really use Symbols-outline for now
-- require("symbols-outline").setup(opts)
