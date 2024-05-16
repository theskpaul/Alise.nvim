return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings
				-- type ":h vim.lsp.*" for lsp documentation
				local opts = { buffer = ev.buf, silent = true }

				-- Set Keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show definition & references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definaitions<CR>", opts) -- Show LSP definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show LSP implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definaitions<CR>", opts) -- Show LSP type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- See available code actions

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename

				opts.desc = "Show buffer diagonstics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagonstics bufnr=0<CR>", opts)

				opts.desc = "Show line diagonstics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagonstics for line

				opts.desc = "Go to previous diagonstics"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Jump to previous diagonstics in buffer

				opts.desc = "Go to next diagonstics"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Jump to next diagonstics in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- Mapping to restart LSP if necessery
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local signs = { Error = "🕱", Warn = "⚠", Hint = "💡", Info = "🛈" }

		for type, icons in pairs(signs) do
			local hl = "DiagonsticSign" .. type
			vim.fn.sign_define(hl, { text = icons, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handlers for lsp servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagonstics = {
								global = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
