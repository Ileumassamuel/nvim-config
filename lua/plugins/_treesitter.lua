-- vim.cmd [[packadd nvim-treesitter]]
-- vim.cmd [[packadd nvim-treesitter-textobjects]]
-- vim.cmd [[packadd nvim-treesitter-refactor]]
-- vim.cmd [[packadd playground]]
-- vim.cmd [[packadd nvim-ts-autotag]]
-- vim.cmd [[packadd nvim-ts-context-commentstring]]
-- vim.cmd [[packadd nvim-ts-hint-textobject ]]

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = { "lua" },  -- list of language that will be disabled
        use_languagetree = false, -- Use this to enable language injection (this is very unstable)
        additional_vim_regex_highlighting = "latex"
    },

    indent = {
        enable = true,
        disable = {"python"},
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
        },
    },

    textobjects = {
        lsp_interop = {
            enable = true,
            -- peek_definition_code = {
            --     ["df"] = "@function.outer",
            --     ["dF"] = "@class.outer",
            -- },
        },
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",

                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- ["il"] = "@loop.inner",
                -- ["al"] = "@loop.outer",

                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer",

                ["a/"] = "@comment.outer",

                ["im"] = "@conditional.inner",
                ["am"] = "@conditional.outer",
            },
        },
        move = {
            enable = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },

    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },

    refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}

vim.api.nvim_set_keymap('o', 'm', ":<C-u>lua require('tsht').nodes()<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', 'm', "<cmd>lua require('tsht').nodes()<cr>", { noremap = true, silent = true })
