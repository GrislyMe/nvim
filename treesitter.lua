require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "python", "lua", "kotlin" },
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	fold = { enable = true }
})
