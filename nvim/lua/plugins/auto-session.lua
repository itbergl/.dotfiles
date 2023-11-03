return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		log_level = "error",
		post_restore_cmds = {
			-- Fix for a bug that opens nvim-tree as a file
			function()
				for _, buffer in pairs(vim.api.nvim_list_bufs()) do
					bufname = vim.api.nvim_buf_get_name(buffer)
					nvim_bufname = "/NvimTree_1"
					if string.find(bufname, nvim_bufname) ~= nil then
						vim.api.nvim_command("NvimTreeToggle")
						return
					end
				end
			end,
		},
	},
}
