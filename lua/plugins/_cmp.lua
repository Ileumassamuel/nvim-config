local cmp = require('cmp')
local compare = require('cmp.config.compare')
local neogen = require('neogen')
local cmpUltisnipsMappings = require("cmp_nvim_ultisnips.mappings")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp_window = require "cmp.utils.window"

function cmp_window:has_scrollbar()
    return false
end

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

cmp.setup({
    window = {
        completion = {
            border = border "CmpBorder",
        },
        documentation = {
            border = border "CmpDocBorder",
        },
    },
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
        { name = "ultisnips", priority = 6 },
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
        format = function(_, vim_item)
            local icons = require "plugins._icons"
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

            return vim_item
        end,
    },
})
