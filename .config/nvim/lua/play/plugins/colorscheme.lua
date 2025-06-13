return {
	"blazkowolf/gruber-darker.nvim",
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("gruber-darker")
		vim.cmd.hi("Normal guibg=#0d0c0b")
		vim.cmd.hi("NonText guibg=none")
		vim.cmd.hi("Normal ctermbg=none")
		vim.cmd.hi("NonText ctermbg=none")
		vim.cmd.hi("StatusLine guibg=#000000 guifg=#fffff")
	end,
}
