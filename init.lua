if vim.g.nvui then
  vim.cmd [[set guifont=FiraCode\ Nerd\ Font:h11]]
  vim.cmd [[NvuiCmdFontFamily FiraCode Nerd Font]]
  vim.cmd [[NvuiCmdFontSize 11.0]]
  vim.cmd [[NvuiScrollAnimationDuration 0.2]]
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd("cd %:p:h")

vim.cmd("colorscheme edge")

vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

require("modules._settings")
require("modules._colorscheme") -- Colorscheme dependent settings
require("modules._mappings")

-- Core Programming Plugins
require("plugins._treesitter")
require("plugins._cmp")
require("plugins._lsp")
require("plugins._dap")
require("plugins._trouble")

-- Git integration
require("plugins._blamer")
require("plugins._gitsigns")

-- Editing plugins
require("plugins._matchup")
require("plugins._ultisnips")
require("plugins._autopairs")
require("plugins._iswap")

-- Finders
require("plugins._telescope")
require("plugins._whichkey")

-- Esthetics
require("plugins._dashboard")
require("plugins._galaxyline")
require("plugins._bufferline")
require("plugins._indentline")
require("plugins._saga")

-- Tex
require("plugins._vimtex")

-- Toggleterm (terminal)
require("plugins._toggleterm")
