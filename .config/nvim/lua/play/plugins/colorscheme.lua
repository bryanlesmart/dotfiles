-- Using lazy.nvim
return {
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("neomodern").setup({
			-- 	theme = "gyokuro",
			-- })
			-- require("neomodern").load()
		end,
	},
	{
		"blazkowolf/gruber-darker.nvim",
		config = function()
			vim.cmd.colorscheme("gruber-darker")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_darken_comments = 45
			-- vim.cmd.colorscheme("zenbones")
		end,
	},
}
