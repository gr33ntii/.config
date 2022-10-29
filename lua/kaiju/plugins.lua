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

    use({"numToStr/FTerm.nvim"})
    use({"onsails/lspkind.nvim"})
    use({"williamboman/mason.nvim"})
    use({'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'})

    use("xiyaowong/nvim-transparent")
    -- Colorscheme
    use('lu-ren/SerialExperimentsLain')
    use({"junegunn/seoul256.vim"})

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")
end)
