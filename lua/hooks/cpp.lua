return function(event)
    local opts = { buffer = event.buf, silent = true }

    -- compile and run
    vim.keymap.set("n", "<leader>r", ":w | !g++ % && ./a.out; rm -f a.out<cr>", opts)
    
    -- insert comment
    vim.keymap.set("i", "<C-c>", "/*  */<Esc>hhi")
end
