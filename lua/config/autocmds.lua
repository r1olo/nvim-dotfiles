-- Templates (hardcoded for now)
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.c",
    command = "0r ~/.config/nvim/templates/skeleton.c | $d | exe 'normal k$' | startinsert!",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.cpp", "*.cc" },
    command = "0r ~/.config/nvim/templates/skeleton.cpp | $d | exe 'normal k$' | startinsert!",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.sh",
    command = "0r ~/.config/nvim/templates/skeleton.sh | exe 'normal j' | startinsert!",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.txt", "*.tex", "*.md", "*.c", "*.h", "*.cpp", "*.hpp", "*.cc", ".hh" },
    command = "set tw=80"
})

-- Very specific configuration for each file
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.c", "*.h" },
    callback = require("hooks.c"),
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cpp", "*.hpp", "*.cc", "*.hh" },
    callback = require("hooks.cpp"),
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.sh",
    callback = require("hooks.sh"),
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tex",
    callback = require("hooks.tex"),
})
