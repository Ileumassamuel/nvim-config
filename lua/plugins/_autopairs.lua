vim.cmd[[packadd nvim-autopairs]]
local npairs = require('nvim-autopairs')

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
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
