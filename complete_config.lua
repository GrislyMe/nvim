-- Setup nvim-cmp.
local cmp = require 'cmp'
cmp.setup({
	view = {
		entries = "custom"
	},
	snippet = {
		expand = function(args)
			require('snippy').expand_snippet(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		}),
	},
	sources = cmp.config.sources(
		{
			{ name = 'copilot',  group_index = 2 },
			{ name = 'nvim_lsp', group_index = 2 },
			{ name = 'snippy',   group_index = 2 },
			{ name = 'buffer',   group_index = 2 },
			{ name = 'path',     group_index = 2 }
		}
	)
})

cmp.setup.cmdline({ '/', '?' }, {
	view = {
		entries = "custom"
	},
	mapping = {
		['<Tab>'] = {
			c = function(_)
				if cmp.visible() then
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					else
						cmp.select_next_item()
					end
				else
					cmp.complete()
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					end
				end
			end,
		},
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
		["<CR>"] = cmp.mapping({
			c = cmp.mapping.confirm({ select = true }),
		}),
	},
	sources = {
		{ name = 'buffer' }
	},
})

cmp.setup.cmdline(':', {
	view = {
		entries = "native"
	},
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Setup lspconfig.
lspconfig.pyright.setup {
	capabilities = capabilities,
}

lspconfig.lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
}

lspconfig.clangd.setup {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
}

-- lspconfig.rust_analyzer.setup {
-- 	capabilities = capabilities,
-- }

vim.opt.completeopt = { "menu", "menuone", "noselect" }
