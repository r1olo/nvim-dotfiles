vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.c",
    command = "0r ~/.config/nvim/templates/skeleton.c | $d | exe 'normal k$' | startinsert!",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.sh",
    command = "0r ~/.config/nvim/templates/skeleton.sh | exe 'normal j' | startinsert!",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.txt", "*.tex", "*.md" },
    command = "set tw=80"
})
