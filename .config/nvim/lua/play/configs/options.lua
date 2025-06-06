function MyColor()
	vim.cmd.colorscheme("habamax")
	vim.cmd([[
	  highlight Normal guibg=none
	  highlight NonText guibg=none
	  highlight Normal ctermbg=none
	  highlight NonText ctermbg=none
	  highlight StatusLine guibg=#000000 guifg=#fffff
	]])
end

MyColor()

vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.relativenumber = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
