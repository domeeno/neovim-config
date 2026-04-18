return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "ayu",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				tabline = {
					lualine_a = {
						function()
							return ""
						end,
					},
					lualine_b = {
						{
							"tabs",
							mode = 1,
							use_mode_colors = true,
							path = 0,
							symbols = { modified = "+" },
							fmt = function(name, context)
								local dev_icons = require("nvim-web-devicons")
								local icon, _ = dev_icons.get_icon(name, nil, { default = true })
								return icon .. " " .. name
							end,
							max_length = vim.o.columns - 1,
						},
					},
					lualine_z = {
						function()
							return " " .. os.date("%H:%M")
						end,
					},
				},
			})
		end,
	},
}
