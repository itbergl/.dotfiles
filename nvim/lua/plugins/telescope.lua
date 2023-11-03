return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"BurntSushi/ripgrep",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<C-s>"] = actions.select_horizontal,
					},
				},
			},
			pickers = {
				live_grep = {
					mappings = {
						i = { ["<c-f>"] = actions.to_fuzzy_refine },
					},
				},
				current_buffer_fuzzy_find = {
					sorting_strategy = "ascending",
					previewer = false,
				},
				builtin = {
					previewer = false,
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Find oldfiles" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find grep" })
		keymap.set("n", "<leader>fw", "<cmd>Telescope buffers<cr>", { desc = "Find tab" })
		keymap.set(
			"n",
			"<leader>fs",
			require("telescope.builtin").current_buffer_fuzzy_find,
			{ desc = "Live buffer search" }
		)
		keymap.set("n", "<leader>fq", function()
			vim.cmd(":cclose")
			require("telescope.builtin").quickfix()
		end, { desc = "Open Quickfix in Telescope" })

		keymap.set("n", "<leader>f;", require("telescope.builtin").resume, { desc = "Resume" })
		keymap.set("n", "<leader>fb", require("telescope.builtin").builtin, { desc = "View Builtin Pickers" })
		keymap.set("n", "<leader>fj", require("telescope.builtin").jumplist, { desc = "View Jumplist" })

		local wk = require("which-key")

		wk.register({
			f = { name = "find" },
		}, { prefix = "<leader>" })
	end,
}
