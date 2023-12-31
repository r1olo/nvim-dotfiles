vim.cmd "packadd packer.nvim"

return require("packer").startup(function(use)
    -- The package manager itself
    use "wbthomason/packer.nvim"

    -- A fuzzy finder with grep capabilities and shit
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function() require("config.telescope") end,
    }

    -- Our theme (config is in config.colorscheme for ALL themes)
    use {
        "Mofiqul/dracula.nvim",
        config = function() require("config.colorscheme") end,
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = { ":TSUpdate" },
        config = function() require("config.treesitter") end,
    }

    -- Undotree plugin
    use {
        "mbbill/undotree",
        config = function() require("config.undotree") end,
    }

    -- Status bar
    use {
        "nvim-lualine/lualine.nvim",
        config = function() require("config.lualine") end,
    }

    -- Autopairs plugin
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end,
    }

    -- HopWord plugin
    use {
        "phaazon/hop.nvim",
        config = function() require("config.hop") end,
    }

    -- Git plugin
    use {
        "tpope/vim-fugitive",
        config = function() require("config.fugitive") end,
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
            { "L3MON4D3/LuaSnip" },
        },
        config = function() require("config.lsp") end,
    }
end)
