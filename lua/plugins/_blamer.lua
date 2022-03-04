-- vim.api.nvim_set_var('blamer_enabled', 1)
-- vim.api.nvim_set_var('blamer_delay', 1000)
-- vim.api.nvim_set_var('blamer_show_in_insert_modes', 0)
vim.api.nvim_set_var('gitblame_ignored_filetypes', {"NvimTree"})

-- vim.cmd[[packadd blamer.nvim]]
vim.cmd[[packadd git-blame.nvim]]
