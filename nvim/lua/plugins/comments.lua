return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		mappings = {
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,

			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
		extra = {
			-- Add comment on the line above
			above = "gck",
			--Add comment on the line below
			below = "gcj",
			--Add comment at the end of line
			eol = "gcl",
		},
	},
}
