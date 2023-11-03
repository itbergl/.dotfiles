return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	lazy = false,
	-- stylua: ignore
	keys = {
	{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
	{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
	{ "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo (Telescope)" },
	{ "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Telescope)" },
	{ "<leader>tc", "<cmd>TodoQuickFix<cr>", desc = "Todo (QuickFix)" },
	{ "<leader>tC", "<cmd>TodoQuickFix keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (QuickFix)" },
	},
	-- config = true,
	config = function()
		require("todo-comments").setup()

		require("which-key").register({
			["<leader>t"] = { name = "Todo" },
		})
	end,
}
