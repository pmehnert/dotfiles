return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }

    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-repeat' }

    use { 'sheerun/vim-polyglot' }
    use { 'scrooloose/nerdtree' }
    use { 'Raimondi/delimitMate' }

    use { 'vim-airline/vim-airline' }
    use { 'vim-airline/vim-airline-themes' }
    use { 'morhetz/gruvbox' }
    use { 'joshdick/onedark.vim' }

    -- use { 'honza/vim-snippets' }
    -- use { 'pgilad/vim-skeletons' }
    -- use { 'vim-syntastic/syntastic' }

    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'L3MON4D3/LuaSnip' }

    use { 'Julian/lean.nvim' }
    use { 'nvim-lua/plenary.nvim' }
end)
