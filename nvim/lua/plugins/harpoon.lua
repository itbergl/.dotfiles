return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("harpoon")

		local mark = require("harpoon.mark")

		toggle_file_callback = function()
			mark.toggle_file(mark.get_current_index())
		end
		-- harpoon
		vim.keymap.set("n", "<leader>vf", toggle_file_callback, { desc = "Mark File" })
		vim.keymap.set("n", "]v", require("harpoon.ui").nav_next, { desc = "Next Harpoon" })
		vim.keymap.set("n", "[v", require("harpoon.ui").nav_prev, { desc = "Previous Harpoon" })
		vim.keymap.set("n", "<leader>vv", ":Telescope harpoon marks<CR>", { desc = "Open Harpoon (Telescope)" })
	end,
}
