local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local signatureAttach = function (client, bufnr)
    require'lsp_signature'.on_attach(
        {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded"
            },
            floating_window = true, -- show hint in a floating window, set to false for virtual
            fix_pos = true,
            hint_enable = false,
            -- use_lspsaga = true,
            -- timer_interval = 200,
            toggle_key = nil
        }, bufnr)
end

local systemName
if vim.fn.has("mac") == 1 then
  systemName = "macOS"
elseif vim.fn.has("unix") == 1 then
  systemName = "linux"
elseif vim.fn.has('win32') == 1 then
  systemName = "windows"
end

-- Yaml language server
lspconfig.yamlls.setup{}

-- Bash language server
lspconfig.bashls.setup{}

lspconfig.eslint.setup{}

lspconfig.ccls.setup{
    init_options = {
        -- compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
        cache = {
            directory = ""
        }
    },
    on_attach = signatureAttach
}
lspconfig.cssls.setup{
    cmd = { (systemName == "linux" and  "vscode-css-languageserver" or "vscode-css-language-server"), "--stdio" },
    capabilities = capabilities
}
lspconfig.dockerls.setup{}

local pid = vim.fn.getpid()
lspconfig.omnisharp.setup{
    cmd = { "omnisharp", "--languageserver" , "--hostPID", tostring(pid) };
}

lspconfig.texlab.setup{
    settings = {
        texlab = {
            -- build = {
            --     onSave = true;
            -- }
        }
    };
}

lspconfig.tsserver.setup{
    on_attach = function(client, bufnr)
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
        client.resolved_capabilities.document_formatting = false

        signatureAttach(client, bufnr)
    end,
    capabilities = capabilities
}

lspconfig.jsonls.setup{
    cmd = { (systemName == "linux" and  "vscode-json-languageserver" or "vscode-json-language-server"), "--stdio" },
    capabilities = capabilities
}
lspconfig.html.setup{
    cmd = { (systemName == "linux" and  "vscode-html-languageserver" or "vscode-html-language-server"), "--stdio" },
    capabilities = capabilities
}

lspconfig.tailwindcss.setup{}

lspconfig.jdtls.setup{}

lspconfig.pylsp.setup{ on_attach = signatureAttach }

lspconfig.rls.setup {}

-- R
lspconfig.r_language_server.setup{ on_attach = signatureAttach }

-- Svelte
lspconfig.svelte.setup{}

-- Writing
lspconfig.ltex.setup{}

-- Prisma
lspconfig.prismals.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
