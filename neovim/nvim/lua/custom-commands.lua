-- Check if the current file is a .uiua file
function Fmt_command()
    -- Save the current file
    vim.cmd("write")

    if vim.bo.filetype == "uiua" then
        vim.cmd("!uiua fmt")
    else
        vim.cmd("normal! <Leader>fm")
    end
end

-- Map the custom command to <Leader>fm
vim.api.nvim_set_keymap("n", "<Leader>fm", ":lua Fmt_command()<CR>", { noremap = true, silent = true })
