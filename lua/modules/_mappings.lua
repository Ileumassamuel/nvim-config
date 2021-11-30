-- Go forward/backward character in insert mode
vim.api.nvim_set_keymap('i', '<C-f>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<Left>', { noremap = true, silent = true })

-- Delete in line
vim.api.nvim_set_keymap('n', 'dil', '^d$', { noremap = true, silent = true })

-- Hide the highlighted text from searches on escape
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR>', { noremap = true, silent = true })

-- Add line mapping
vim.api.nvim_set_keymap('n', ']<space>', ":<C-u>put =repeat(nr2char(10),v:count)<Bar>execute \"'[-1\"<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']o', ":<C-u>put =repeat(nr2char(10),v:count)<Bar>execute \"'[-1\"<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '[<space>', ":<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute \"']+1\"<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[o', ":<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute \"']+1\"<CR>", { noremap = true, silent = true })

-- Pasting
-- vim.api.nvim_set_keymap('n', 'p', "p=`]", { noremap = true, silent = true })

-- Sane window resizing
vim.api.nvim_set_keymap('n', '<Left>', "<CMD>vertical resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', "<CMD>vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', "<CMD>resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', "<CMD>resize -2<CR>", { noremap = true, silent = true })

-- remove annoying exmode
vim.api.nvim_set_keymap('n', 'Q', "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q:', "<Nop>", { noremap = true, silent = true })

-- Goto beginning/end of line
vim.api.nvim_set_keymap('n', 'gl', "g_", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gl', "g_", { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'gl', "g_", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gh', "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gh', "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'gh', "^", { noremap = true, silent = true })
