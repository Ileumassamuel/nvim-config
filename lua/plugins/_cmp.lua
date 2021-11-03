local cmp = require'cmp'
local neogen = require('neogen')

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
            elseif neogen.jumpable() then
                vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<C-k>'] = function(fallback)
            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = "ultisnips" },
        { name = 'path' },
        { name = "latex_symbols" },
    }
})
