return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	lazy = false,
	keys = {
	{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
	{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
	{ "<leader>tt", "<cmd>TodoQuickFix<cr>", desc = "Todo" },
	{ "<leader>tT", "<cmd>TodoQuickFix keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
	},
	-- config = true,
	config = function()
		require("todo-comments").setup()

		require("which-key").register({
			["<leader>t"] = { name = "Todo" },
		})
	end,
}
