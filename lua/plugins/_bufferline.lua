vim.cmd[[packadd nvim-bufferline.lua]]

local options = {
    show_buffer_close_icons = false,
    separator_style = {"", ""},
    diagnostics = "nvim_lsp",
    buffer_close_icon= '',
    offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left" }},
}

require("bufferline").setup{
    options = options,
}

vim.api.nvim_set_keymap('n', 'gb', [[<Cmd>BufferLinePick<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-1>', [[<Cmd>lua require('bufferline').go_to_buffer(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-2>', [[<Cmd>lua require('bufferline').go_to_buffer(2)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-3>', [[<Cmd>lua require('bufferline').go_to_buffer(3)<CR>]], { noremap = true, silent = true })
