return {
	"kdheepak/lazygit.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.lazygit_floating_window_scaling_factor = 0.9
		vim.keymap.set("n", "<leader>gg", "<CMD>LazyGit<CR>", { desc = "LazyGit" })

		require("which-key").register({
			g = { name = "git" },
		}, { prefix = "<leader>" })
	end,
}
