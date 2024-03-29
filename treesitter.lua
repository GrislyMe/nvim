require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "python", "lua", "kotlin" },
	highlight = {
		enable = true,
	},
})

vim.api.nvim_set_option("foldmethod", "expr")
vim.api.nvim_set_option("foldexpr", "nvim_treesitter#foldexpr()")
vim.api.nvim_set_option("foldlevelstart", 20)
