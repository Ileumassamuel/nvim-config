vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd("cd %:p:h")

vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

vim.cmd("colorscheme aurora")

-- Want neovim with a transparent background? Keep the two following lines
vim.cmd[[highlight Normal guibg=none]]
vim.cmd[[highlight NonText guibg=none]]

require("modules._settings")
require("modules._colorscheme") -- Colorscheme dependent settings
require("modules._mappings")

-- Essential keybindings
require("plugins._whichkey")

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
require("plugins._autopairs")
require("plugins._iswap")

-- Finders
require("plugins._telescope")

-- Esthetics
require("plugins._dashboard")
require("plugins._galaxyliner")
require("plugins._bufferline")

-- Tex
require("plugins._vimtex")

-- Wilder
require("plugins._wilder")
