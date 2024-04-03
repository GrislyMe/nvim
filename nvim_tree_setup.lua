-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.del("n", "d", { buffer = bufnr })

	-- custom mappings
	vim.keymap.set("n", "<", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", ">", api.tree.change_root_to_node, opts("Down"))
	vim.keymap.set("n", "s", api.node.open.vertical, opts("vsplit"))
	vim.keymap.set("n", "hs", api.node.open.horizontal, opts("split"))
	vim.keymap.set("n", "dd", api.fs.remove, opts("remove"))
	vim.keymap.set("n", "mv", api.fs.rename, opts("rename"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	sort_by = "case_sensitive",
	view = {
		width = 35,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
