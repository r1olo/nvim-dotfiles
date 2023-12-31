require("hop").setup()

vim.keymap.set("n", "<C-s>", ":HopWord<cr>", { silent = true })
