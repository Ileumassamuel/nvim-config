-- Bootstrap packer if it ain't installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    -- Treesitter (better syntax highlighting + more)
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        requires = {
            {'nvim-treesitter/playground'}, -- playground for treesitter
            {'nvim-treesitter/nvim-treesitter-textobjects'}, -- "smart" textobjects
            {'nvim-treesitter/nvim-treesitter-refactor'}, -- refactor?
            { 'windwp/nvim-ts-autotag' },
            { "mfussenegger/nvim-ts-hint-textobject" },
            { "JoosepAlviste/nvim-ts-context-commentstring" }
        },
    }

    -- Language server protocol
    use {'neovim/nvim-lspconfig'}
    -- UI for Lsp commands
    use {'ileumassamuel/lspsaga.nvim', opt = true, requires = { 'onsails/lspkind-nvim' } }
    -- UI for Lsp errors
    use {
        "folke/trouble.nvim",
        opt = true
    }
    -- Signature help
    use {
        "ray-x/lsp_signature.nvim"
    }

    use {'onsails/lspkind-nvim'}

    -- Completion framework
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'SirVer/ultisnips'},
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'quangnguyen30192/cmp-nvim-ultisnips' },
            { 'hrsh7th/cmp-path'},
            { "kdheepak/cmp-latex-symbols" },
            { "hrsh7th/cmp-buffer" },
            { 'onsails/lspkind-nvim' }
        },
    }

    -- Debugger
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }

    -- Snippets
    use {'honza/vim-snippets' }

    -- Interface
    use {
        'kyazdani42/nvim-tree.lua', 
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'nvim-tree'.setup {} end,
    } -- super fast file tree viewer
    use {
        "SmiteshP/nvim-gps",
        -- after = "nvim-treesitter",
        config = function ()
            require("nvim-gps").setup()
        end,
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use {
        'ileumassamuel/galaxyline.nvim',
        branch = 'bugfix/diagnostics',
        -- after = "nvim-gps",
        requires = {'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'nvim-web-devicons'.setup { default = true; }
        end
    } -- Status line
    use { 'glepnir/dashboard-nvim', opt = true} -- Menu
    use { "folke/which-key.nvim" }
    use {'akinsho/nvim-bufferline.lua', opt = true} -- bufferline
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        },
    } -- extensible fuzzy finder


    -- Esthetic
    use { 'lukas-reineke/indent-blankline.nvim', branch = 'master' } -- Indent lines

    -- Colorschemes (just the best)
    use { 'sainnhe/sonokai' }
    use { 'sainnhe/edge' }
    use { 'olimorris/onedarkpro.nvim' }
    use { 'ChristianChiarulli/nvcode-color-schemes.vim' }
    use { 'srcery-colors/srcery-vim' }
    use { 'folke/tokyonight.nvim' }
    use { 'glepnir/zephyr-nvim' }

    -- Git
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }
    }
    use {'junegunn/gv.vim', requires = {'tpope/vim-fugitive'}}
    use { 'f-person/git-blame.nvim', opt = true } -- inline blaming

    -- Editing
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {'andymass/vim-matchup', event = 'VimEnter *'} -- Match
    use {'rrethy/vim-hexokinase', run = "make hexokinase"} -- Colorize hex values
    use {'AndrewRadev/splitjoin.vim'} -- Split and join lines, but better
    use {'tommcdo/vim-exchange'} -- Exchange text locations
    use {'junegunn/vim-easy-align'} -- Align characters
    use {'tpope/vim-surround'} -- Surround text
    use {'matze/vim-move'} -- Move lines/characters
    use {'tpope/vim-repeat'} -- Repeat using dot command from plugins
    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {
                enabled = true,
            }
        end,
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use {'windwp/nvim-autopairs', opt = true} -- autopairs brackets, braces etc
    use { 'mizlan/iswap.nvim', opt = true } -- Swap parameters / list items


    -- Quick movements
    -- use {'phaazon/hop.nvim', opt = false} -- easymotion but better
    use { 'ggandor/lightspeed.nvim' }

    -- Tex
    use {'lervag/vimtex', ft = {'tex'} } -- Tex
    use {'KeitaNakamura/tex-conceal.vim', ft = {'tex'} }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup { }
        end
    }
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup { }
        end
    }

    use { 'moll/vim-bbye' }
    use { 'akinsho/nvim-toggleterm.lua', opt = true }

end)
