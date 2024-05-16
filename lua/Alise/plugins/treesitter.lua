return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- Configure treesitter
		treesitter.setup({
			modules = {},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			-- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- Enable indentation
			indent = {
				enable = true,
			},
			-- Enable autotaging (w /nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- Ensure those language parsers are installed
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"gitignore",
				"html",
				"json",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"r",
				"rust",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
