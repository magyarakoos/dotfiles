local lspconfig = require('lspconfig')

if not lspconfig.emmylua_ls then
    lspconfig.emmylua_ls = {
        default_config = {
            cmd = { "false" },
            filetypes = {},
            root_dir = function() return nil end,
            settings = {},
        }
    }
end

lspconfig.emmylua_ls.setup = function() end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure plugins ]]
require("lazy-plugins")

-- [[ Setting options ]]
require("options")

-- [[ Basic Keymaps ]]
require("keymaps")

-- [[ Configure Telescope ]]
require("telescope-setup")

-- [[ Configure Treesitter ]]
require("treesitter-setup")

-- [[ Configure LSP ]]
require("lsp-setup")

-- [[ Configure nvim-cmp ]]
require("cmp-setup")

-- [[ Set custom highlights ]]
require("highlights")

-- [[ Set custom commands ]]
require("custom-commands")
