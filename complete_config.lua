-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('snippy').expand_snippet(args.body)
		end,
	},
	mapping = {
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'buffer' },
		{ name = 'path' }
	}
})

-- Setup lspconfig.
local ls = { 'pyright', 'lua_ls' }
for i, server in ipairs(ls) do
	require('lspconfig')[server].setup {
		on_attach = on_attach,
		capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

require("lspconfig").clangd.setup {
	on_attach = on_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
}

vim.opt.completeopt = { "menu", "menuone", "noselect" }
