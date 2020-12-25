set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

set guicursor=
set noincsearch
set nohlsearch
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

"LSP Client configuration
lua << EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.pyls.setup{
  cmd = { "pyls" }
}
nvim_lsp.rust_analyzer.setup{}
local function do_nothing(_, _, _, _)
end

vim.lsp.callbacks["textDocument/publishDiagnostics"] = do_nothing
EOF

nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>] <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

autocmd FileType yaml setlocal sts=2 expandtab sw=2
autocmd FileType json setlocal sts=2 expandtab sw=2
autocmd FileType html setlocal expandtab sw=2 sts=-1
autocmd FileType ts setlocal expandtab sw=2 sts=-1
autocmd FileType markdown setlocal tw=100
