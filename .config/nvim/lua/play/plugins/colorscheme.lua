return {
	"vague2k/vague.nvim",
	config = function()
		vim.cmd.colorscheme("vague")
		vim.cmd.hi("StatusLine guibg=#101010 guifg=#fffff")
		-- vim.cmd.hi("Structure guifg=#FAF3E3")
		-- vim.cmd.hi("Normal guibg=#101010")
		-- vim.cmd.hi("String guifg=#789978")
	end,
}
