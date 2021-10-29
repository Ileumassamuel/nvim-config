vim.g.kommentary_create_default_mappings = false

vim.cmd[[packadd kommentary]]

vim.api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})

local config = require('kommentary.config')

config.configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
})

config.configure_language("python", {
    single_line_comment_string = "#"
})

config.configure_language('typescriptreact', {
    single_line_comment_string = 'auto',
    multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})
