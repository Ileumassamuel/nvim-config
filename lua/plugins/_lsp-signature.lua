vim.cmd[[packadd lsp_signature.nvim]]

require'lsp_signature'.on_attach(
    {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded"
        },
        floating_window = true, -- show hint in a floating window, set to false for virtual
        fix_pos = true,
        hint_enable = false,
        -- use_lspsaga = true
    }
)
