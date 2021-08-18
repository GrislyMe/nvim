local nvim_lsp = require('lspconfig')
local lsp_install = require('lspinstall')
local saga = require('lspsaga')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

local function setup_servers()
	require('lspconfig').pyright.setup{on_attach=require('completion').on_attach}
	require('lspconfig').clangd.setup{on_attach=require('completion').on_attach}
end

setup_servers()

