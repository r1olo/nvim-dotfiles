return {
    "phaazon/hop.nvim",
    config = function()
        require("hop").setup()
        vim.keymap.set("n", "<C-s>", ":HopWord<cr>", { silent = true })
    end
}
