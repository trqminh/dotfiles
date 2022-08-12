"Vim plug
set nocompatible              " required
filetype off                  " required

" --------------------------------
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

" PLUGIN LIST HERE

" search
Plug '~/.fzf'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" theme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" code completetion
if has('nvim')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" nerdtree
Plug 'preservim/nerdtree'

" Indent
Plug 'Yggdroot/indentLine'

call plug#end()
"----------------------------------------------------------
"----------------------------------------------------------

" nerd tree toggle
noremap <Leader>n :NERDTreeToggle<CR>

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
"set relativenumber
set hlsearch
set ruler
set autoindent

set noswapfile
set nobackup
set lazyredraw
set updatetime=100
set pastetoggle=<F2> "pastetoggle
highlight Comment ctermfg=green

" This is only necessary if you use "set termguicolors".
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
set t_Co=256
set termguicolors
colorscheme catppuccin_macchiato

set mouse=a

"For proper tabbing and bracket insertion"
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>


"select all, copy clipboard
map <C-a> <esc>ggVG<CR>

"tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

nnoremap <C-f> :FZF<CR>

"faster moving
nnoremap L w
nnoremap H b
nnoremap K <C-u>
nnoremap J <C-d>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" clever tab
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" insert cursor
if !has('nvim')
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
endif
