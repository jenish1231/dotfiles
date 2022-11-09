return require('packer').startup(function() 
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'

    use 'tpope/vim-surround'

    -- color scheme
    use 'sainnhe/edge'
    use 'LunarVim/onedarker.nvim'
    use 'NTBBloodbath/doom-one.nvim'
    use 'Mofiqul/dracula.nvim'

    -- lspconfigs
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'rust-lang/rust.vim'

    use 'onsails/lspkind.nvim'
    use 'RyanMillerC/better-vim-tmux-resizer'
    use 'APZelos/blamer.nvim'
    use "leafgarland/typescript-vim"
    use 'nvim-lualine/lualine.nvim'

    -- tree sitter configs
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'

    -- telescope
    use { 'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'tpope/vim-commentary'
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    }

    use 'psliwka/vim-smoothie' 
    use "williamboman/nvim-lsp-installer"

    use 'jose-elias-alvarez/null-ls.nvim'

    -- use 'Yggdroot/indentLine'
    use "lukas-reineke/indent-blankline.nvim"
    use 'szw/vim-maximizer'

    use 'airblade/vim-gitgutter'
    use 'jiangmiao/auto-pairs'
    use 'dyng/ctrlsf.vim'

    use 'mg979/vim-visual-multi'
    use 'voldikss/vim-floaterm'

    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use "ray-x/web-tools.nvim"

end)
