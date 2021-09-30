local nvim_lsp = require('lspconfig')
local lsp_install = require('lspinstall')
local saga = require('lspsaga')
local capabilities = vim.lsp.protocol.make_client_capabilities()

local signature_setup = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "single"
      }
    }, bufnr)
  end
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}


local function setup_servers()
	--nvim_lsp.pyright.setup{on_attach=require('completion').on_attach}
	--nvim_lsp.clangd.setup{on_attach=require('completion').on_attach}
end

setup_servers()

