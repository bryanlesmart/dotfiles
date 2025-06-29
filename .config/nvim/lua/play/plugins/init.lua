return {
	{
		"APZelos/blamer.nvim",
		config = function()
			vim.g.blamer_enabled = 1
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
		config = function()
			require("colorizer").setup()
		end,
	},
	-- {
	-- 	"HiPhish/rainbow-delimiters.nvim",
	-- 	{
	-- 		"lewis6991/gitsigns.nvim",
	-- 		opts = {
	-- 			signs = {
	-- 				add = { text = "+" },
	-- 				change = { text = "~" },
	-- 				delete = { text = "_" },
	-- 				topdelete = { text = "‾" },
	-- 				changedelete = { text = "~" },
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"tpope/vim-fugitive",
	},
}
