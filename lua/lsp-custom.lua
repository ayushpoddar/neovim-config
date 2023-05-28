local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
	require('completion').on_attach()

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
			require('lspconfig').util.nvim_multiline_command [[
			:hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
			:hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
			:hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
			augroup lsp_document_highlight
					autocmd!
					autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
					autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
			]]
	end
end

nvim_lsp.solargraph.setup{
	settings = {
		solargraph = {
			formatting = true
		}
	},
	on_attach = on_attach
}

nvim_lsp.tsserver.setup{}
