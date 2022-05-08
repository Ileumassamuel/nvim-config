local cmd = vim.api.nvim_command
local api = vim.api

local apply_options = function(opts)
    for k, v in pairs(opts) do
        if v == true then
            cmd('set ' .. k)
        elseif v == false then
            cmd(string.format('set no%s', k))
        else
            cmd(string.format('set %s=%s', k, v))
        end
    end
end

local options = {

    -- Boolean value
    autoindent = true, -- enable autoindent
    backup = false, -- disable backup
    cursorline = false, -- enable cursorline
    expandtab = true, -- use spaces instead of tabs
    autowrite = true, -- autowrite buffer when it's not focused
    hidden = true, -- keep hidden buffers
    hlsearch = true, -- don't highlight matching search
    ignorecase = true, -- case insensitive on search
    lazyredraw = true, -- lazyredraw to make macro faster
    -- list = true, -- display listchars
    number = true, -- enable number
    relativenumber = true, -- enable relativenumber
    showmode = false, -- don't show mode
    smartcase = true, -- improve searching using '/'
    smartindent = true, -- smarter indentation
    smarttab = true, -- make tab behaviour smarter
    splitbelow = true, -- split below instead of above
    splitright = true, -- split right instead of left
    startofline = false, -- don't go to the start of the line when moving to another file
    swapfile = false, -- disable swapfile
    termguicolors = true, -- truecolours for better experience
    wrap = false, -- don't wrap lines
    writebackup = false, -- disable backup
    joinspaces = false,

    -- String value
    -- completeopt = 'menu,menuone,noselect,noinsert', -- better completion
    completeopt = "menuone,noselect",
    -- fillchars = "vert:│,eob:\\ ", -- make vertical split sign better

    -- foldmethod = "marker",
    foldmethod = "expr", -- foldmethod using marker
    foldexpr = "nvim_treesitter#foldexpr()", -- foldmethod using marker

    inccommand = "split", -- incrementally show result of command
    -- listchars = "eol:↲,tab:»\\ ", -- set listchars
    mouse = "a", -- enable mouse support
    shortmess = "csa", -- disable some stuff on shortmess
    -- signcolumn = "yes", -- enable sign column all the time, 4 column
    clipboard = "unnamedplus",

    -- Number value
    textwidth = 80, -- Wrap at 80
    pumheight = 10, -- limit completion items
    re = 0, -- set regexp engine to auto
    scrolloff = 2, -- make scrolling better
    shiftwidth = 4, -- set indentation width
    sidescroll = 4, -- make scrolling better
    tabstop = 4, -- tabsize
    sidescrolloff = 15, -- make scrolling better
    synmaxcol = 300, -- set limit for syntax highlighting in a single line
    conceallevel = 2,
    timeoutlen = 500, -- faster timeout wait time
    updatetime = 100, -- set faster update time
    laststatus = 3, -- global status vlines
}

apply_options(options)

local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

local glslFiletypes = api.nvim_create_augroup("GlslFiletypes", { clear = true })
api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    { pattern = { "*.vs.glsl", "*.fs.glsl" }, command = "set filetype=glsl", group = glslFileTypes }
)

local jsTsTaberoo = api.nvim_create_augroup("JsTsTaberoo", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "typescriptreact", "javascript" },
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab",
    group = jsTsTaberoo,
})

local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd(
    { "InsertEnter" },
    { pattern = "*", command = "set cul", group = cursorGrp }
)
api.nvim_create_autocmd(
    { "InsertLeave" },
    { pattern = "*", command = "set nocul", group = cursorGrp }
)
