return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["=-"] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                        ["=="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
					},
				},

				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
					},
					goto_next_end = {
						["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
					},
					goto_previous_start = {
						["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
						["[c"] = { query = "@class.outer", desc = "Prev class start" },
					},
					goto_previous_end = {
						["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
						["[C"] = { query = "@class.outer", desc = "Prev class end" },
					},
				},
			},
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		-- vim way: ; goes to the direction you were moving.
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

	end,
}
