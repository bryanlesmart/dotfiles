return {
	"savq/melange-nvim",
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("melange")
		vim.cmd.hi("Normal guibg=#000000")
		vim.cmd.hi("NonText guibg=none")
		vim.cmd.hi("Normal ctermbg=none")
		vim.cmd.hi("NonText ctermbg=none")
		vim.cmd.hi("StatusLine guibg=#000000 guifg=#fffff")
	end,
}
