vim.cmd "packadd packer.nvim"

return require("packer").startup(function(use)
    -- The package manager itself
    use "wbthomason/packer.nvim"

    -- A fuzzy finder with grep capabilities and shit
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = require("config.telescope"),
    }

    -- Our theme (config is in config.colorscheme for ALL themes)
    use {
        "Mofiqul/dracula.nvim",
        config = require("config.colorscheme"),
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = { ":TSUpdate" },
        config = require("config.treesitter"),
    }

    -- Undotree plugin
    use {
        "mbbill/undotree",
        config = require("config.undotree"),
    }

    -- Indent blank line
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = require("config.ibl"),
    }

    -- Status bar
    use {
        "nvim-lualine/lualine.nvim",
        config = require("config.lualine"),
    }

    -- Autopairs plugin
    use {
        "windwp/nvim-autopairs",
        config = require("config.autopairs"),
    }

    -- HopWord plugin
    use {
        "phaazon/hop.nvim",
        config = require("config.hop"),
    }

    -- Git plugin
    use {
        "tpope/vim-fugitive",
        config = require("config.fugitive"),
    }

    -- LSP configuration (dependencies can be in any order really)
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-path" },
            { "L3MON4D3/LuaSnip" },
        },
        config = require("config.lsp"),
    }
end)
