local cmp = require'cmp'

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<TAB>'] = cmp.mapping.confirm({ select = true }),

        ["<C-Space>"] = cmp.mapping.complete(),

        ['<C-e>'] = cmp.mapping.close(),

        ['<C-j>'] = function(fallback)
            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpForwards()<CR>"))
            elseif vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-n>"), "n")
            else
                fallback()
            end
        end,
        ['<C-k>'] = function(fallback)
            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
            elseif vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-p>"), "n")
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = "ultisnips" },
        { name = 'path' },
        -- { name = "latex_symbols" },
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })[entry.source.name]
            return vim_item
        end
    }
})
