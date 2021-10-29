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
        opt = true
    }

    -- Language server protocol
    use {'neovim/nvim-lspconfig', opt = false}
    -- UI for Lsp commands
    -- use {'glepnir/lspsaga.nvim', opt = true, branch = 'main', requires = { 'onsails/lspkind-nvim' } }
    -- UI for Lsp errors
    use {
        "folke/trouble.nvim",
        opt = true
    }
    -- Signature help
    -- use {
    --     "ray-x/lsp_signature.nvim",
    --     opt = true
    -- }

    -- Completion framework
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'SirVer/ultisnips'},
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'quangnguyen30192/cmp-nvim-ultisnips' },
            { 'hrsh7th/cmp-path'},
            { "kdheepak/cmp-latex-symbols" },
        },
    }
    -- use { 
    --     'ms-jpq/coq_nvim', 
    --     branch = 'coq',
    --     requires = {
    --         {'SirVer/ultisnips'},
    --     },
    -- }

    -- Debugger
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }
    -- use {'puremourning/vimspector' , opt= true}

    -- Snippets
    use {'honza/vim-snippets', opt = false}

    -- Interface
    use {
        'kyazdani42/nvim-tree.lua', 
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'nvim-tree'.setup {} end,
        opt = false,
    } -- super fast file tree viewer
    use {
        'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons'},
        config = function ()
            require'nvim-web-devicons'.setup {
                -- globally enable default icons (default to false)
                -- will get overriden by `get_icons` option
                default = true;
            }
        end
    } -- Status line
    use { 'glepnir/dashboard-nvim', opt = true} -- Menu
    use { "folke/which-key.nvim" }
    -- use { 'liuchengxu/vim-which-key', opt = false, requires = { 'glepnir/lspsaga.nvim' }} -- Keybinding reminder
    use {'akinsho/nvim-bufferline.lua', opt = true} -- bufferline
    use {
        'nvim-telescope/telescope.nvim',
        opt = false,
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        },
    } -- extensible fuzzy finder


    -- Esthetic
    use { 'lukas-reineke/indent-blankline.nvim', branch = 'master' } -- Indent lines
    -- use {
    --     'yamatsum/nvim-web-nonicons',
    --     requires = {'kyazdani42/nvim-web-devicons'},
    --     opt = false
    -- } -- Nice icons?

    -- Colorschemes (just the best)
    use { 'sainnhe/sonokai' }
    use { 'sainnhe/edge' }
    use { 'olimorris/onedarkpro.nvim' }
    use { 'ChristianChiarulli/nvcode-color-schemes.vim' }
    use { 'srcery-colors/srcery-vim' }
    use { 'folke/tokyonight.nvim' }
    use { 'glepnir/zephyr-nvim' }
    -- use { 'projekt0n/github-nvim-theme',
    --     config = function()
    --         require("github-theme").setup {
    --             themeStyle = "dark",
    --         }
    --     end
    -- }

    -- Git
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }
    }
    use {'junegunn/gv.vim', requires = {'tpope/vim-fugitive'}, opt = false}
    use { 'f-person/git-blame.nvim', opt = true } -- inline blaming

    -- Editing
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- use {'b3nj5m1n/kommentary', opt = true } -- Commenting
    -- use { "tpope/vim-commentary", opt = false } -- Commenting

    use {'andymass/vim-matchup', event = 'VimEnter *'} -- Match
    use {'rrethy/vim-hexokinase', run = "make hexokinase"} -- Colorize hex values
    use {'AndrewRadev/splitjoin.vim', opt = false} -- Split and join lines, but better
    use {'tommcdo/vim-exchange', opt = false} -- Exchange text locations
    use {'junegunn/vim-easy-align', opt = false} -- Align characters
    use {'tpope/vim-surround', opt = false } -- Surround text
    use {'matze/vim-move'} -- Move lines/characters
    use {'tpope/vim-repeat'} -- Repeat using dot command from plugins
    use { 'kkoomen/vim-doge', run = ":call doge#install()",
        config = function ()
            vim.api.nvim_set_var('doge_enable_mappings', 0)
        end
    }
    use {'windwp/nvim-autopairs', opt = true} -- autopairs brackets, braces etc

    -- Quick movements
    -- use {'phaazon/hop.nvim', opt = false} -- easymotion but better
    use { 'ggandor/lightspeed.nvim' }

    -- Tex
    use {'lervag/vimtex', ft = {'tex'} } -- Tex
    use {'KeitaNakamura/tex-conceal.vim', ft = {'tex'} }

    -- Misc
    -- use {'psliwka/vim-smoothie', 
    --     config = function ()
    --         vim.api.nvim_set_var('smoothie_enabled', 1)
    --     end
    -- }
    -- use { 'karb94/neoscroll.nvim',
    --     config = function()
    --         require("neoscroll").setup {
    --             hide_cursor = false,
    --         }
    --     end
    -- }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- use { 'airblade/vim-rooter',
    --     config = function ()
    --         vim.api.nvim_set_var('rooter_silent_chdir', 1)
    --     end
    -- }
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use { 'moll/vim-bbye' }
    use { 'akinsho/nvim-toggleterm.lua', opt = true }

end)
