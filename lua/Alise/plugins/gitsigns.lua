return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = require("gitsigns")

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage Hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset Hunk")

			map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")

			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

			map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

			map("n", "<leader>hd", gs.diffthis, "Diff this")
			map("n", "<leader>hD", function()
				gs.difftis("~")
			end, "Diff this ~")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-u>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
