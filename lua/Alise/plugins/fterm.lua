return {
	"numToStr/FTerm.nvim",
	config = function()
		vim.api.nvim_create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
		vim.api.nvim_create_user_command("FTermExit", require("FTerm").exit, { bang = true })
		vim.api.nvim_create_user_command("FTermOpen", require("FTerm").open, { bang = true })
		vim.api.nvim_create_user_command("FTermClose", require("FTerm").close, { bang = true })

		vim.api.nvim_create_user_command("CargoRun", function()
			require("FTerm").run({ "cargo", "run" })
		end, { bang = true })

		vim.api.nvim_create_user_command("CargoTest", function()
			require("FTerm").run({ "cargo", "test" })
		end, { bang = true })

		vim.api.nvim_create_user_command("CargoCheck", function()
			require("FTerm").run({ "cargo", "check" })
		end, { bang = true })

		vim.api.nvim_create_user_command("CargoBuild", function()
			require("FTerm").run({ "cargo", "build" })
		end, { bang = true })

		local keymap = vim.keymap

		keymap.set("n", "<F4>", "<cmd>FTermToggle<CR>", { desc = "Crate/Toggle floating Terminal" })
		keymap.set("t", "<F4>", "<cmd>FTermToggle<CR>", { desc = "Crate/Toggle floating Terminal" })
	end,
}
