local tb = require 'telescope.builtin'
local lsp = vim.lsp.buf

local on_attach = function(args)
    local bufnr = args.buf
    ---@type CustomMapping[]
    local mappings = {
        { 'ca',         lsp.code_action,           desc = 'Code Actions' },
        {
            'gh',
            function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
            end,
            desc = 'Toggle Inlay Hints',
        },
        { 'e',          vim.diagnostic.open_float, desc = "Show diagnostic" },
        { 'gd',         tb.lsp_definitions,        desc = 'Goto Definition' },
        { 'gr',         tb.lsp_references,         desc = 'Goto References' },
        { 'gI',         tb.lsp_implementations,    desc = 'Goto Implementation' },
        { '<leader>D',  tb.lsp_type_definitions,   desc = 'Type Definition' },
        { '<leader>ds', tb.lsp_document_symbols,   desc = 'Document Symbols' },
        { '<C-S-k>',    lsp.signature_help,        desc = 'Signature Documentation' },
        { 'gD',         lsp.declaration,           desc = 'Goto Declaration' },
    }

    for _, map in ipairs(mappings) do
        map.buffer = bufnr
    end

    require('keymaps').register_mappings(mappings)
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = on_attach,
    group = vim.api.nvim_create_augroup(
        'lspconfig-lsp-attach',
        { clear = true }
    ),
})

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
-- require('mason').setup()
-- require("mason-lspconfig").setup({
--     automatic_installation = false, -- disable automatic install
--     ensure_installed = {},          -- make sure this is empty
-- })

local servers = {
    bashls = {},
    jdtls = {},
    cssls = {
        settings = {
            css = {
                validate = true,
                lint = {
                    unknownAtRules = "ignore",
                }
            },
        },
    },
    svelte = {},
    ocamllsp = {},
    taplo = {},
    htmx = {},
    vimls = {},
    html = {
        filetypes = { "html", "templ", "htmldjango" }
    },
    templ = {},
    gopls = {},
    pyright = {},
    nil_ls = {},
    rust_analyzer = {},
    tailwindcss = { filetypes = { 'html', 'htmldjango' } },
    typescript_language_server = {},

    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
            },
        },
    },


    ltex = {
        autostart = false,
        ltex = {
            completionEnabled = true,
            dictionary = { ['en-US'] = { 'uiua', 'nvim', 'vim', 'todo' } },
            checkFrequency = 'save',
        },
    },

    jsonls = {
        -- TODO: schema store stuff
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
        filetypes = { 'json', 'jsonc' },
    },

    emmet_ls = {
        filetypes = { "html", "htmldjango", "svelte", "templ" },
    },
}

local custom_servers = {
    uiua = {},
    rust_analyzer = {
        cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
        filetypes = { 'rust' },
        ['rust-analyzer'] = {
            cargo = { allFeatures = true },
            rustfmt = {},
        },
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function lspconfig_setup(server_list)
    return function(server_name)
        local config = server_list[server_name] or {}
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = config,
            cmd = config.cmd,
            root_dir = config.root_dir,
            filetypes = config.filetypes,
            autostart = config.autostart,
        }
    end
end

function merge_servers(a, b)
    local result = {}

    for k, v in pairs(b) do
        result[k] = v
    end

    for k, v in pairs(a) do
        result[k] = v
    end

    return result
end

local all_servers = merge_servers(custom_servers, servers)

print(all_servers)

for server_name, _ in pairs(all_servers) do
    lspconfig_setup(all_servers)(server_name)
end
