vim.api.nvim_set_var('UltiSnipsExpandTrigger', '<Nop>')
vim.api.nvim_set_var('UltiSnipsJumpForwardTrigger',  '<Nop>')
vim.api.nvim_set_var('UltiSnipsJumpBackwardTrigger', '<Nop>')

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
            build = {
                onSave = true;
            }
        }
    };
}

lspconfig.tsserver.setup{
    on_attach = function(client, bufnr)
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
        client.resolved_capabilities.document_formatting = false
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

-- lspconfig.pylsp.setup{}
lspconfig.pyright.setup{}

lspconfig.rls.setup {}

-- R
lspconfig.r_language_server.setup{}

-- Svelte
lspconfig.svelte.setup{}

-- Writing
lspconfig.ltex.setup{}

-- Prisma
lspconfig.prismals.setup{}

-- Golang
lspconfig.gopls.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
