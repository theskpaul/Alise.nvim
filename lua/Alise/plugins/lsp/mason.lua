return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Setting up mason
		mason.setup({
			ui = {
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			-- List of servers for mason to install
			ensure_installed = {
				"html",
				"rust_analyzer",
				"lua_ls",
				"cssls",
				"clangd",
				"tsserver",
				"pyright",
				"intelephense",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"isort",
				"black",
				"pylint",
				"eslint_d",
			},
		})
	end,
}
