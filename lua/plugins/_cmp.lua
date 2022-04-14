local cmp = require('cmp')
local compare = require('cmp.config.compare')
local neogen = require('neogen')
local lspkind = require('lspkind')
local cmpUltisnipsMappings = require("cmp_nvim_ultisnips.mappings")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    experimental = { ghost_text = true },
    mapping = {
        ['<TAB>'] = cmp.mapping.confirm({ select = true }),

        -- ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

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
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = "ultisnips" },
        { name = 'path' },
        -- { name = 'buffer' },
        { name = "latex_symbols" },
    },
    sorting = {
        comparators = {
            compare.locality,
            compare.recently_used,
            compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            compare.offset,
            compare.order,
        },
    },
    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    }
})
