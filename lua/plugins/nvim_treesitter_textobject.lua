return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					lookahead = true,
					-- Automatically jump forward to textobj, similar to targets.vim
					enable = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						["ac"] = "@class.outer",
						["ic"] = "@class.inner",

						["ab"] = "@block.outer",
						["ib"] = "@block.inner",

						["al"] = "@loop.outer",
						["il"] = "@loop.inner",

						["ar"] = "@return.outer",
						["ir"] = "@return.inner",

						["aa"] = "@assignment.outer",
						["ia"] = "@assignment.rhs",

						["aP"] = "@parameter.outer",
						["iP"] = "@parameter.inner",

						-- You can also use captures from other query groups like `locals.scm`
						["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner",
						["<leader>nf"] = "@function.outer",
					},
					swap_previous = {
						["<leader>nA"] = "@parameter.inner",
						["<leader>nF"] = "@function.outer",
					},
				},
			},
		})
		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
	end,
}
