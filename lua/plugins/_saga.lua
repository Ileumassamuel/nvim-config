saga.setup {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
}

-- Saga mappings
vim.api.nvim_set_keymap('n', 'K',[[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })
