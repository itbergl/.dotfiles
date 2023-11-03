return {
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			mappings = {
				add = "gs", -- Add surrounding in Normal and Visual modes
				delete = "g<S-s>", -- Delete surrounding
				find = "", -- Find surrounding (to the right)
				find_left = "", -- Find surrounding (to the left)
				highlight = "", -- Highlight surrounding
				replace = "", -- Replace surrounding
				update_n_lines = "", -- Update `n_lines`
				suffix_last = "", -- Suffix to search with "prev" method
				suffix_next = "", -- Suffix to search with "next" method
			},
		},
	},
	{
		"echasnovski/mini.move",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "",
                right = "",
                down = "<M-j>",
                up = "<M-k>",

				-- Move current line in Normal mode
				line_left = "",
				line_right = "",
				line_down = "<M-j>",
				line_up = "<M-k>",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"echasnovski/mini.bufremove",
		lazy = false,
		keys = {
			{
				"<leader>w",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>W",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},
}
