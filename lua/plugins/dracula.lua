return {
    "Mofiqul/dracula.nvim",
    config = function()
        vim.cmd("colorscheme dracula")
        vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
    end
}
