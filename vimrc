call plug#begin('~/.vim/plugged')
Plug '~/.fzf'
Plug 'airblade/vim-gitgutter'
call plug#end()


syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set hlsearch
set ruler

set mouse=a
set ttymouse=xterm2


highlight Comment ctermfg=green
set bg=dark

set noswapfile
set nobackup


" clever tab
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" search
nnoremap <C-p> :FZF<CR>
