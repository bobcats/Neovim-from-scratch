vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  autocmd BufNewFile,BufRead *.env,.env set filetype=conf
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format { filter = function (client) return client.name ~= "tsserver" or client.name ~= "solargraph" or client.name ~= "eslint" or client.name ~= "typescript-tools" end }
    autocmd BufWritePost *.tsx,*.ts FormatWrite
    " autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
    " autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js TSLspOrganizeSync
    " autocmd BufWritePre *.tsx,*.ts TypescriptOrganizeImports
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
