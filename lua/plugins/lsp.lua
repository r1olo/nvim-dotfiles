return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- core lspconfig plugin (required for vim.lsp.config shim in 0.11)
        { "neovim/nvim-lspconfig" },
        -- mason packages
        { "mason-org/mason.nvim" },
        { "mason-org/mason-lspconfig.nvim" },
        -- cmp sources
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-path" },
        { "L3MON4D3/LuaSnip" },
    },
    config = function()
        -- 1. Standard Diagnostic Config
        vim.diagnostic.config({ virtual_text = true })
        
        -- 2. Define Capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 3. Mason Setup
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {},
        })

        -----------------------------------------------------------------------
        -- 4. Native LSP Configuration
        -----------------------------------------------------------------------
        
        -- Define the configuration for clangd in the global registry
        vim.lsp.config.clangd = {
            capabilities = capabilities,
            cmd = { 
                "clangd", 
                "--background-index", 
                -- We MUST whitelist the ESP-IDF tools here. 
                -- This cannot be done in .clangd for security reasons.
                "--query-driver=**/.espressif/tools/**/bin/*gcc*"
            },
            root_markers = { ".clangd", ".git", "compile_commands.json" },
        }

        -- Enable the server globally
        -- This tells nvim-lspconfig to attach this server to C/C++ buffers
        vim.lsp.enable("clangd")

        -----------------------------------------------------------------------
        -- 5. LspAttach & Keymaps
        -----------------------------------------------------------------------
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
                vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
                vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
                vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
            end,
        })

        -- 6. CMP Setup
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({
            sources = { { name = "nvim_lsp" }, { name = "buffer" }, { name = "path" } },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            snippet = {
                expand = function(args) require("luasnip").lsp_expand(args.body) end,
            },
        })
    end
}
