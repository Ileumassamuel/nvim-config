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
    cmd = { "vscode-css-languageserver", "--stdio" },
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

        -- signatureAttach(client, bufnr)
    end,
    capabilities = capabilities
}

lspconfig.jsonls.setup{
    cmd = { "vscode-json-languageserver", "--stdio" },
    capabilities = capabilities
}
lspconfig.html.setup{
    cmd = { "vscode-html-languageserver", "--stdio" },
    capabilities = capabilities
}
lspconfig.jdtls.setup{}

lspconfig.pylsp.setup{ on_attach = signatureAttach }

lspconfig.rls.setup {}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
lspconfig.sumneko_lua.setup{
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

-- R
lspconfig.r_language_server.setup{ on_attach = signatureAttach }

-- Svelte
lspconfig.svelte.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
