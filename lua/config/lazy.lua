-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
          { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
          { out, "WarningMsg" },
          { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require("lazy").setup {
    -- lualine
    require("plugins.lualine"),

    -- colorscheme
    require("plugins.colorscheme"),

    -- telescope
    require("plugins.telescope"),

    -- treesitter
    require("plugins.treesitter"),

    -- autopairs
    require("plugins.autopairs"),

    -- hopword
    require("plugins.hop"),

    -- lsp
    require("plugins.lsp"),

    -- ibl
    require("plugins.ibl"),

    -- undotree
    require("plugins.undotree"),

    -- fugitive
    require("plugins.fugitive"),
}
