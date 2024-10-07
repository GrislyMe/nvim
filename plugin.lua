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
	-- scheme
	{ "tomasr/molokai",       lazy = true },
	{ "morhetz/gruvbox",      lazy = true },

	-- leetcode
	--{
	--	"kawre/leetcode.nvim",
	--	build = ":TSUpdate html",
	--	dependencies = {
	--		"nvim-telescope/telescope.nvim",
	--		"nvim-lua/plenary.nvim", -- required by telescope
	--		"MunifTanjim/nui.nvim",

	--		-- optional
	--		"rcarriga/nvim-notify",
	--	},
	--	opts = {
	--		-- configuration goes here
	--	},
	--},

	-- git
	{ "tpope/vim-fugitive" },

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
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup()
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
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.rustfmt,
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
	{
		'altermo/ultimate-autopair.nvim',
		event = { 'InsertEnter', 'CmdlineEnter' },
		branch = 'v0.6', --recommended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		}
	},

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
