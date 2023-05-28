" autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 100)

