local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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

-- Yaml language server
lspconfig.yamlls.setup{}

-- Bash language server
lspconfig.bashls.setup{}

-- C++ static analysis/linting
local cppcheck = {
    lintCommand = "cppcheck --quiet --force --enable=style --error-exitcode=1 ${INPUT}",
    lintStdin = false,
    lintFormats = { "%f:%l:%c: %m" },
    rootMarkers = { "compile_commands.json" }
}

-- Python linting
local black = {
    formatCommand = "black -",
    formatStdin = true
}

local mypy = {
    lintCommand = "mypy --show-column-numbers --ignore-missing-imports",
    lintFormats = {"%f=%l:%c: %trror: %m", "%f=%l:%c: %tarning: %m", "%f=%l:%c: %tote: %m"}
}

-- Prettier
local prettier = {
    formatCommand = ([[
    ./node_modules/.bin/prettier
    ${--config-precedence:configPrecedence}
    ${--tab-width:tabWidth}
    ${--single-quote:singleQuote}
    ${--trailing-comma:trailingComma}
    ]]):gsub(
            "\n",
            ""
        )
}

local format_options_prettier = {
    tabWidth = 4,
    singleQuote = true,
    trailingComma = "all",
    configPrecedence = "prefer-file"
}

vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_yaml = format_options_prettier

lspconfig.eslint.setup{}
-- lspconfig.efm.setup{
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             python = { black },
--             yaml = { prettier },
--             json = { prettier },
--             html = { prettier },
--             css = { prettier },
--             cpp = { cppcheck }
--         }
--     }
-- }

lspconfig.ccls.setup{
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
    }
}
lspconfig.cssls.setup{}
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
    on_attach = function(client)
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
        client.resolved_capabilities.document_formatting = false
    end,
    capabilities = capabilities
}

lspconfig.jsonls.setup{}
lspconfig.html.setup{}
lspconfig.jdtls.setup{}

lspconfig.pylsp.setup{}

lspconfig.rls.setup {}

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
lspconfig.r_language_server.setup{}

-- Svelte
lspconfig.svelte.setup{}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

-- vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
