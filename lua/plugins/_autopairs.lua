vim.cmd[[packadd nvim-autopairs]]
local npairs = require('nvim-autopairs')
local remap = vim.api.nvim_set_keymap

npairs.setup{
  break_line_filetype = nil, -- enable this rule for all filetypes
  pairs_map = {
    ["'"] = "'",
    ['"'] = '"',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['`'] = '`',
  },
  disable_filetype = { "TelescopePrompt" },
  html_break_line_filetype = {
    'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'
  },
  -- ignore alphanumeric, operators, quote, curly brace, and square bracket
  ignored_next_char = "[%w%.%+%-%=%/%,\"'{%[]"
}

require("nvim-autopairs.completion.cmp").setup({
  map_cr = false, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  -- auto_select = false -- automatically select the first item
})

vim.g.completion_confirm_key = ""

MUtils.giveMeANewLine = function()
    if vim.fn.pumvisible() ~= 0  then
        return npairs.esc("<C-e><cr>")
    else
        return npairs.autopairs_cr()
    end
end

remap('i' , '<CR>','v:lua.MUtils.giveMeANewLine()', {expr = true , noremap = true})
