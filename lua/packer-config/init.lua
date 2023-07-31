return require('packer').startup(function() 
	use 'wbthomason/packer.nvim'

	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'

    use 'tpope/vim-surround'

-- color scheme
     use({
        "themercorp/themer.lua",
        config = function()
	      require("themer").setup({
	          colorscheme = "rose_pine",
	          styles = {
	            	["function"] = { style = 'italic' },
	            functionbuiltin = { style = 'italic' },
	            variable = { style = 'italic' },
	            variableBuiltIn = { style = 'italic' },
	            	parameter  = { style = 'italic' },
	          },
	      })
        end
    })

    -- lspconfigs
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    -- use 'rust-lang/rust.vim'
    use 'SmiteshP/nvim-navic'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use 'onsails/lspkind.nvim'
    use 'RyanMillerC/better-vim-tmux-resizer'
    use 'APZelos/blamer.nvim'
    use "leafgarland/typescript-vim"
    use 'nvim-lualine/lualine.nvim'
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

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

    use "lukas-reineke/indent-blankline.nvim"
    use 'szw/vim-maximizer'

    -- use 'airblade/vim-gitgutter'
    use 'jiangmiao/auto-pairs'
    use 'nvim-pack/nvim-spectre'

    use 'mg979/vim-visual-multi'

    -- documentation generator
    use {
      'kkoomen/vim-doge',
      run = ':call doge#install()'
    }

    use 'echasnovski/mini.nvim'
    use 'mbbill/undotree'
    use 'lewis6991/gitsigns.nvim'
    use 'christoomey/vim-tmux-navigator'
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        },
        config = function() 
            require('refactoring').setup()
        end
    }
end)
