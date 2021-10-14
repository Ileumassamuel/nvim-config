vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd("cd %:p:h")

vim.cmd("colorscheme onedark")

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
require("plugins._kommentary")
require("plugins._ultisnips")
require("plugins._autopairs")

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
