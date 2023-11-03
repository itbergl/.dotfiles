return {
	"folke/flash.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local flash = require("flash")

		flash.setup({
			modes = { char = { enabled = false } },
		})

        local modes = { "n", "x", "o" }

		vim.keymap.set(modes, "s", function()
			flash.jump()
		end)

		vim.keymap.set(modes, "<A-s>", function()
			flash.treesitter()
		end)
	end,
}
