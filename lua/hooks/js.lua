return function(event)
    local opts = { buffer = event.buf, silent = true }

    -- insert comment
    vim.keymap.set("i", "<C-c>", "/*  */<Esc>hhi")
end
