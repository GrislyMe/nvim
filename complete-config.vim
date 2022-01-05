set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
		vim.fn["vsnip#anonymous"](args.body)
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
  local ls = { 'clangd', 'pyright'}
  for i, server in ipairs(ls) do
	  require('lspconfig')[server].setup {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	  }
  end
EOF
