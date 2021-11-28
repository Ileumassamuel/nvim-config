vim.cmd[[packadd lspsaga.nvim]]

local saga = require('lspsaga')

saga.setup {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
}

-- Saga mappings
-- vim.api.nvim_set_keymap('n', '[e',[[<Cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', ']e',[[<Cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K',[[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })

-- Consider lsp signature - waiting on the plugin to support fixed signature menu
-- vim.api.nvim_set_keymap('n', '<C-k>',[[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-k>',[[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], { noremap = true, silent = true })
