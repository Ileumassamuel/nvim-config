local lry = require('legendary')
local wk = require("which-key")

lry.setup()

wk.register({
    [' '] = { '<cmd>Telescope find_files<cr>', 'Find file in project' },
    ['.'] = { '<cmd>Telescope find_files<cr>', 'Find file' },
    [','] = { '<cmd>Telescope buffers<cr>', 'Find buffer' },
    ['*'] = { '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Search symbol in project' },
    ['<CR>'] = { '<cmd>Telescope marks<cr>', 'Show marks' }, -- ^M seems to be registered
    ['`'] = { '<cmd>write | edit | TSBufEnable highlight<cr>', 'Fix highlighting' },
    f = {
        name = '+file',
        s = { '<cmd>update<cr>', 'Save file' },
        i = { '<cmd>e $MYVIMRC<cr>', 'Edit init.lua' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Recent files' },
        f = { '<cmd>Telescope file_browser<cr>', 'Find file' },
        p = { '<cmd>Telescope file_browser<cr>', 'Find file in project' },
        b = { '<cmd>Telescope marks<cr>', 'Go to bookmark' },
    },
    w = {
        name = '+window',
        v = { '<cmd>vsp<cr>', 'vertical-split' },
        s = { '<cmd>sp<cr>', 'horizontal-split' },
        d = { '<cmd>close<cr>', 'close' },
        c = { '<cmd>close<cr>', 'close' },
        D = { '<cmd>only<cr>', 'widow-close-all' },
        j = { '<cmd>wincmd j<cr>', 'window-down' },
        k = { '<cmd>wincmd k<cr>', 'window-up' },
        h = { '<cmd>wincmd h<cr>', 'window-left' },
        l = { '<cmd>wincmd l<cr>', 'window-right' },
        L = { '<C-w>L', 'window-move-right' },
        H = { '<C-w>H', 'window-move-left' },
        J = { '<C-w>J', 'window-move-down' },
        K = { '<C-w>K', 'window-move-up' },
        R = { '<C-w>R', 'window-rotate' },
        ["="] = {'<C-w>=', 'window-resize-equal'}
    },
    b = {
        name = '+buffer',
        d = { '<cmd>Bdelete<cr>', 'Delete buffer' },
        k = { '<cmd>Bdelete<cr>', 'Kill buffer' },
        K = { '<cmd>Bdelete!<cr>', 'Force kill buffer' },
        h = { '<cmd>Dashboard<cr>', 'Goto menu' },
        b = { '<cmd>Telescope buffers<cr>', 'Show buffers'},
        s = { '<cmd>w<cr>', 'Save buffer'},
        S = { '<cmd>wa<cr>', 'Save all buffers' },
        f = { '<cmd>execute "lua vim.lsp.buf.formatting()"<cr>', 'Format buffer'}
    },
    t = {
        name = '+toggle',
        e = { '<cmd>NvimTreeToggle<cr>', 'Toggle tree' },
        s = { '<cmd>set spell!<cr>', 'Toggle spell checker' },
        z = { '<cmd>ZenMode<cr>', 'Zen mode' },
        l = { '<cmd>set number! relativenumber!<cr>', 'Toggle line numbers' },
        -- m = { '<cmd>let g:smoothie_enabled=0<cr>', 'Disable smoothie' },
        b = { '<cmd>GitBlameToggle<cr>', 'Toggle blamer' },
        c = { '<cmd>Telescope colorscheme<cr>', 'Change colorscheme' },
    },
    s = {
        name = '+search',
        p = { '<cmd>Telescope live_grep<cr>', 'Search project' },
        b = { '<cmd>Telescope live_grep<cr>', 'Search buffer' },
        s = { '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Search symbol in project' },
        i = { '<cmd>Telescope lsp_document_symbols<cr>', 'Search symbol in buffer' },
        w = { '<cmd>Telescope live_grep<cr>', 'Search word in project' },
        f = { '<cmd>Telescope file_browser<cr>', 'Search file' },
        m = { '<cmd>Telescope marks<cr>', 'Jump to bookmark' },
    },
    c = {
        name = '+code',
        d = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics"},
        -- r = { "<cmd>execute \"lua lua.vim.lsp.rename()\"<cr>", "Rename symbol" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename symbol" },
        -- d = { "<cmd>execute \"lua vim.lsp.diagnostic.show_line_diagnostics()\"<cr>", "Show line diagnostics"},
        w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Show workspace diagnostics" },
        -- a = { "<cmd>execute \"lua require('telescope.builtin').lsp_code_actions()\"<cr>", "Code actions"},
        a = { "<cmd>Lspsaga code_action<cr>", "Code actions"},
        x = { "<cmd>TroubleToggle<cr>", "Show errors"},
        s = { "<cmd>ISwap<cr>", "Swap params"}
    },
    g = {
        name = '+git',
        -- g = { "<cmd>execute \"lua require('lspsaga.floaterm').open_float_terminal('lazygit')\"<cr>", 'Git status'},
        s = { "<cmd>execute \"lua require'gitsigns'.stage_hunk()\"<cr>", 'Stage hunk'},
        S = { "<cmd>execute \"lua require'gitsigns'.stage_buffer()\"<cr>", 'Stage buffer'},
        u = { "<cmd>execute \"lua require'gitsigns'.undo_stage_hunk()\"<cr>", 'Undo stage hunk'},
        r = { "<cmd>execute \"lua require'gitsigns'.reset_hunk()\"<cr>", 'Reset hunk'},
        R = { "<cmd>execute \"lua require'gitsigns'.reset_buffer()\"<cr>", 'Reset buffer'},
        p = { "<cmd>execute \"lua require'gitsigns'.preview_hunk()\"<cr>", 'Preview hunk'},
        b = { '<cmd>Git blame<cr>', 'Git blame' },
    },
    h = {
        name = '+hunk',
        s = { "<cmd>execute \"lua require'gitsigns'.stage_hunk()\"<cr>", 'Stage hunk'},
        S = { "<cmd>execute \"lua require'gitsigns'.stage_buffer()\"<cr>", 'Stage buffer'},
        u = { "<cmd>execute \"lua require'gitsigns'.undo_stage_hunk()\"<cr>", 'Undo stage hunk'},
        r = { "<cmd>execute \"lua require'gitsigns'.reset_hunk()\"<cr>", 'Reset hunk'},
        R = { "<cmd>execute \"lua require'gitsigns'.reset_buffer()\"<cr>", 'Reset buffer'},
        p = { "<cmd>execute \"lua require'gitsigns'.preview_hunk()\"<cr>", 'Preview hunk'},
        b = { '<cmd>Git blame<cr>', 'Git blame' },
    },
    i = {
        name = '+insert',
        d = { "<cmd>execute \"lua require('neogen').generate()\"<cr>", 'Insert documentation'}
    },
    d = {
        name = '+debug',
        b = { "<cmd>execute \"lua require('dap').toggle_breakpoint()\"<cr>", 'Toggle breakpoint'},
        B = { "<cmd>execute \"lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))\"<cr>", 'Set breakpoint'},
        r = { "<cmd>execute \"lua require('dap').repl.open()\"<cr>", 'Open repl'},
        l = { "<cmd>execute \"lua require('dap').run_last()\"<cr>", 'Run last'},
        t = { "<cmd>execute \"lua require('dapui').toggle()\"<cr>", 'Toggle debugger UI'}
    },
    ["<Tab>"] = {
        name = '+workspace',
        ["]"] = { "<cmd>BufferLineCycleNext<cr>", "Next tab" },
        ["["] = { "<cmd>BufferLineCyclePrev<cr>", "Next tab" },
    }
}, { prefix = "<leader>" })

-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

wk.register({
    h = "Previous hunk",
    -- e = { "<cmd>execute \"lua vim.lsp.diagnostic.goto_prev()\"<cr>", "Previous lsp error"},
    e = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous lsp error"},
    [" "] = "Add lines above",
    o = "Add lines above",
    ["["] = "Previous class start",
}, { prefix = "["})

wk.register({
    h = "Next hunk",
    -- e = { "<cmd>execute \"lua vim.lsp.diagnostic.goto_next()\"<cr>" , "Next lsp error"},
    e = { "<cmd>Lspsaga diagnostic_jump_next<cr>" , "Next lsp error"},
    [" "] = "Add lines below",
    o = "Add lines below",
    ["]"] = "Next class start",
}, { prefix = "]"})

wk.register({
    d = { "<cmd>execute \"lua vim.lsp.buf.definition()\"<cr>", "Go to definition" },
    R = { "<cmd>Telescope lsp_references<cr>", "Go to reference" },

    r = { "<cmd>TroubleToggle lsp_references<cr>", "Go to reference" },

    -- D = { "<cmd>execute \"lua require'lspsaga.provider'.lsp_finder()\"<cr>", "Preview definition and references" },
    ["0"] = { "<cmd>execute \"lua vim.lsp.buf.document_symbol()\"<cr>", "Go to document symbol" },
    -- bug with mapping below
    -- s = { "<cmd>execute \"lua require'lspsaga.provider'.preview_definition()\"<cr>", "Preview definition" },

    h = "Goto line start",
    l = "Goto line end",
    J = "Join line",
    S = "Split line"
}, { prefix = "g"})

wk.register({
    i = {
        c = "inner class",
        f = "inner function",
        l = "inner line",
    },
    a = {
        c = "outer class",
        f = "outer function",
        ["/"] = "outer comment",
    }
}, { prefix = "d"})
