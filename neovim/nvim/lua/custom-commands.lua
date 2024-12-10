-- Automagically format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Map the custom command to <Leader>fm
vim.api.nvim_set_keymap("n", "<Leader>fm", ":lua Fmt_command()<CR>", { noremap = true, silent = true })

function Reset_input_macro()
    -- Path to the input file
    local input = vim.fn.expand("%:p:h") .. "/input"
    vim.fn.writefile({}, input)
    vim.cmd("split " .. input)
    vim.cmd("resize 15")
end

function Run_script_macro()
    -- Get the current file type
    local current_file = vim.fn.expand("%:p")
    local file_ext = vim.fn.expand("%:e")

    -- Check if the file is .cpp, .jl, or .py
    if file_ext ~= "cpp" and file_ext ~= "jl" and file_ext ~= "py" and file_ext ~= "tex" then
        vim.cmd('echo "This file format is not supported"')
        return
    end

    if file_ext == "tex" then
        vim.cmd("normal @l")
        return
    end

    -- Save the current file
    vim.cmd("write")

    local input = vim.fn.expand("%:p:h") .. "/input"

    -- Check if 'input' file exists, if not, create it and open it in a new buffer
    if vim.fn.filereadable(input) == 0 then
        vim.cmd("new " .. input) -- Open a new buffer with the file 'input'
        vim.cmd("resize 15") -- Resize the buffer window to 15 lines

        vim.cmd('echo "No input file, create one"')
        return
    end

    -- Define the command to run based on the file extension
    local run_cmd = ""
    if file_ext == "cpp" then
        run_cmd = "cpprun " .. current_file .. " main < " .. input
    elseif file_ext == "jl" then
        run_cmd = "julia " .. current_file .. " < " .. input
    elseif file_ext == "py" then
        run_cmd = "python " .. current_file .. " < " .. input
    end

    -- Execute the command and capture the output
    local output = vim.fn.systemlist(run_cmd)

    -- Open a new window and display the output
    vim.cmd("new")
    vim.cmd("setlocal nobuflisted")
    vim.cmd("resize 15")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
end

-- Set up the key mapping for the macro
vim.api.nvim_set_keymap("n", "<Leader>b", ":lua Run_script_macro()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>eb", ":lua Reset_input_macro()<CR>", { noremap = true, silent = true })

