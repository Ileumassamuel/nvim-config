if vim.g.nvui then
  vim.cmd [[set guifont=FiraCode\ Nerd\ Font:h11]]
  vim.cmd [[NvuiCmdFontFamily FiraCode Nerd Font]]
  vim.cmd [[NvuiCmdFontSize 11.0]]
  vim.cmd [[NvuiScrollAnimationDuration 0.2]]
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd("cd %:p:h")

vim.cmd("colorscheme srcery")

require("modules._settings")
require("modules._colorscheme") -- Colorscheme dependent settings
require("modules._mappings")

require("plugins")

-- Core Programming Plugins
require("plugins._treesitter")
require("plugins._cmp")
require("plugins._lsp")
require("plugins._dap")
require("plugins._trouble")
-- require("plugins._lsp-signature")

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
require("plugins._kinds")

-- Tex
require("plugins._vimtex")

-- Toggleterm (terminal)
require("plugins._toggleterm")

-- Nvui
if vim.g.nvui then
  -- Configure through vim commands
  vim.cmd [[NvuiCmdFontFamily Jetbrains Mono]]
end
