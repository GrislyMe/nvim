vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "tomasr/molokai",       lazy = true },
	{ "morhetz/gruvbox",      lazy = true },

	-- auto complete
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		init = function()
			require("mason").setup()
		end,
		cmd = "Mason",
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({
				border_style = "single",
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "ray-x/lsp_signature.nvim" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.completion.spell,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- file explore
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- status bar
	{ "majutsushi/tagbar" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- language support
	{ "nvim-treesitter/nvim-treesitter" },
	{ "jiangmiao/auto-pairs" },

	-- terminal
	{ "akinsho/nvim-toggleterm.lua" },

	-- other
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		opts = {},
		init = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					header = {
						[[____________________________________________________________]],
						[[|                                                          |]],
						[[|    ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗      |]],
						[[|    ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║      |]],
						[[|    ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║      |]],
						[[|    ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║      |]],
						[[|    ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║      |]],
						[[|    ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝      |]],
						[[|                     █▀▀ █▀█ █ █▀ █░░ █▄█ █▀▄▀█ █▀▀       |]],
						[[|                     █▄█ █▀▄ █ ▄█ █▄▄ ░█░ █░▀░█ ██▄       |]],
						[[|                                                          |]],
						[[|__________________________________________________________|]],
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
})
