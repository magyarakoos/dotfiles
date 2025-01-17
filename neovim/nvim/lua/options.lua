vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Telescope find_files")
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
})

vim.filetype.add({ extension = { ua = "uiua", lil = "lil" } })

local ft_opts = {
	uiua = function()
		vim.o.spell = false
	end,
}

local ft_opts_group = vim.api.nvim_create_augroup("FileOpts", { clear = true })

for ft, opts in pairs(ft_opts) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = ft,
		callback = opts,
		group = ft_opts_group,
	})
end

-- set commentsring to // for c and cpp files
vim.cmd("autocmd FileType c setlocal commentstring=//\\ %s")
vim.cmd("autocmd FileType cpp setlocal commentstring=//\\ %s")

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.foldmethod = "manual"
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.o.termguicolors = true
vim.opt.sidescroll = 0
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.wrap = false -- Don't wrap lines
vim.o.cursorline = true
vim.o.cursorlineopt = "line"
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.o.updatetime = 50
vim.o.colorcolumn = tostring(80)
vim.o.mouse = "" -- Disable mouse
vim.o.clipboard = "unnamed"
vim.o.spell = true
vim.o.spelllang = "en_us"

vim.lsp.set_log_level(4)

-- Enable transparency to match the terminal background
-- vim.cmd([[
-- highlight Normal guibg=NONE ctermbg=NONE
-- highlight NonText guibg=NONE ctermbg=NONE
-- highlight LineNr guibg=NONE ctermbg=NONE
-- highlight StatusLine guibg=NONE ctermbg=NONE
-- ]])
