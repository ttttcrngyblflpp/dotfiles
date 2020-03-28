set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

set guicursor=
set noincsearch
set nohlsearch

"LSP Client configuration
lua << EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.rls.setup{
  cmd = { "/usr/local/google/home/gongt/fuchsia/prebuilt/third_party/rust/linux-x64/bin/rls" }
}
nvim_lsp.gopls.setup{
  cmd = { "/usr/local/google/home/gongt/go/bin/gopls" }
}
nvim_lsp.clangd.setup{
  cmd = { "clangd", "--compile-commands-dir", "out/default" }
}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
