local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'onsails/lspkind-nvim' --vscode like pictograms
    use 'nvim-lua/plenary.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'williamboman/mason.nvim' -- Manage language server installs
    use 'williamboman/mason-lspconfig.nvim' -- Manage language server installs
    use 'neovim/nvim-lspconfig' -- Enable LSP
    use 'jose-elias-alvarez/null-ls.nvim' --neovim lang server to inject lsp diagnostics code actions etc
    use 'glepnir/lspsaga.nvim' -- LSP UIs

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag' --ts=treesitter (autoclose html tags)
    use 'norcalli/nvim-colorizer.lua'
    use 'akinsho/nvim-bufferline.lua'

    ---- install markdownpreview without yarn or npm
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim'
    --Plugings here
end)
