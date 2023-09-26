vim.cmd[[ packadd packer.nvim ]]

return require("packer").startup(function(use)
    -- Packer God
    use 'wbthomason/packer.nvim'

    --  Lodash4Vim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")


    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("nvim-lua/lsp_extensions.nvim")
    use({"simrat39/symbols-outline.nvim"})
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use({"nvim-tree/nvim-tree.lua"})
    use({'andweeb/presence.nvim'})
    use({'jiangmiao/auto-pairs'})

    use({'romgrk/barbar.nvim', requires = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    }})

    use({"onsails/lspkind.nvim"})
    use({"williamboman/mason.nvim"})

    -- Colorscheme
    use("xiyaowong/nvim-transparent")
    use('lu-ren/SerialExperimentsLain')
    use({"junegunn/seoul256.vim"})

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")
end)
