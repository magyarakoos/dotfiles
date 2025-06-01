local tb = require 'telescope.builtin'
local lsp = vim.lsp.buf

local on_attach = function(args)
    local bufnr = args.buf
    ---@type CustomMapping[]
    local mappings = {
        { 'ca',        lsp.code_action,         desc = 'Code Actions' },
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
require('mason').setup()
require('mason-lspconfig').setup()

local tsserver_opts = {
    inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
    },
}

local servers = {
    bashls = {},
    jdtls = {},
    cssls = {},
    svelte = {},
    ocamllsp = {},
    taplo = {},
    htmx = {},
    vimls = {},
    tsserver = { typescript = tsserver_opts, javascript = tsserver_opts },
<<<<<<< HEAD
    html = { filetypes = { 'html', 'htmldjango' } },
=======
    html = {
        filetypes = { "html", "templ", "htmldjango" }
    },
>>>>>>> f5e1e1f (sync: 2025-06-01 19:58:24)
    templ = {},
    gopls = {},
    pyright = {},
    nil_ls = {},
    rust_analyzer = {},
    tailwindcss = { filetypes = { 'html', 'htmldjango' } },

    clangd = { filetypes = { 'c', 'cpp' } },

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

<<<<<<< HEAD
    emmet_language_server = { filetypes = { 'html', 'svelte', 'templ', 'htmldjango' } },
=======
    emmet_ls = {
        filetypes = { "html", "htmldjango", "svelte", "templ" },
    },
>>>>>>> f5e1e1f (sync: 2025-06-01 19:58:24)

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields', 'need-check-nil' } },
            hint = {
                enable = true,
                arrayIndex = 'Disable',
            },
            hover = { enumsLimit = 20 },
        },
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

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

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

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
    lspconfig_setup(servers)(server_name)
end

local custom_setup = lspconfig_setup(custom_servers)

for server_name, _ in pairs(custom_servers) do
    custom_setup(server_name)
end
