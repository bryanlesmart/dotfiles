return {
	"blazkowolf/gruber-darker.nvim",
	config = function()
		vim.cmd.colorscheme("gruber-darker")
		vim.cmd.hi("StatusLine guibg=#0101010 guifg=#fffff")
		vim.cmd.hi("Normal guibg=#101010")
		vim.cmd.hi("Character guifg=#789978")
	end,
}
