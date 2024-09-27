return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<F5>", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })
	end,
}
