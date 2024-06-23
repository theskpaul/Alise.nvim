return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local trouble = require("trouble.sources.telescope")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = { ["<c-t>"] = trouble.open },
					n = { ["<c-t>"] = trouble.open },
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
