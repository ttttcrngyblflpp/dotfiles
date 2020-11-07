set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" start of original vimrc
set nocompatible

filetype plugin indent on
syntax on

set cmdheight=2
set completeopt-=preview
set completeopt+=menuone
set hidden
set number
set relativenumber

" XXX remove me
color mine

call plug#begin('~/.config/nvim/plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'rust-lang/rust.vim'
"Plug 'lifepillar/vim-mucomplete'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

" bufexplorer options
" show relative paths by default
let g:bufExplorerShowRelativePath = 1

command! -nargs=* -complete=dir H
  \ call fzf#run({'sink': 'e', 'source': 'rg --files --hidden --no-ignore <args>', 'down': '40%'})
nnoremap <silent> <c-p> :Files<CR>

" end of original vimrc

set guicursor=
set noincsearch
set nohlsearch
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

"LSP Client configuration
lua << EOF
require'lspconfig'.pyls.setup{
  cmd = { "pyls" }
}
require'lspconfig'.rust_analyzer.setup{}

local function do_nothing(_, _, _, _)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = do_nothing
EOF

nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>] <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

nnoremap <silent> zq zz16<C-E>

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
autocmd FileType bo setlocal sts=4 expandtab sw=4
