return {
	"folke/which-key.nvim",
	lazy = false,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		require("which-key").register({
			b = {
				name = "buffer",
			},
			v = {
				name = "Harpoon",
			},
		}, { prefix = "<leader>" })
	end,
}
