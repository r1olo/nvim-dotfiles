-- return {
--     "Mofiqul/dracula.nvim",
--     config = function()
--         vim.cmd("colorscheme dracula")
--         vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
--     end
-- }

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup{
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            }
        }
        vim.cmd("colorscheme tokyonight")
    end
}
