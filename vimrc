"Vim plug
set nocompatible              " required
filetype off                  " required

" --------------------------------
call plug#begin('~/.vim/plugged')
" search
Plug '~/.fzf'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" theme
Plug 'overcache/NeoSolarized'

" code completetion
if has('nvim')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" nerdtree
Plug 'preservim/nerdtree'
Plug 'baopham/vim-nerdtree-unfocus'

call plug#end()
"----------------------------------------------------------
"----------------------------------------------------------

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set hlsearch
set ruler
set autoindent

set noswapfile
set nobackup
set nofixendofline
set lazyredraw
"set updatetime=100
highlight Comment ctermfg=green


set background=dark
colo dim
hi clear SignColumn
"set t_Co=256
"set termguicolors
"colorscheme NeoSolarized

set mouse=a
set ttymouse=xterm2

" key map
nnoremap <C-p> :FZF<CR>

" clever tab
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


" gitgutter signs
let g:gitgutter_sign_added    = '┃'
let g:gitgutter_sign_modified = '┋'

" nerdtree config
" nerd tree toggle
noremap <Leader>n :NERDTreeToggle<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" close nerdtree when close tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree to the right
let g:NERDTreeWinPos = "right"
