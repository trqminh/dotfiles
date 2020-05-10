"Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" PLUGIN LIST HERE

"super search
Plugin 'kien/ctrlp.vim'

"theme stuffs
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'niklaas/lightline-gitdiff'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'

" added nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" ALE
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"end of vundle
"----------------------------------

"nerdtree conf
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"let NERDTreeMapOpenInTab='<ENTER>'
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"color scheme
colo dracula

"transparent
hi Normal guibg=NONE ctermbg=NONE

" air-line
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'readonly', 'modified' ],
      \             [ 'gitdiff' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename', 'gitversion' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ 'component_expand': {
      \   'gitdiff': 'lightline#gitdiff#get',
      \ },
      \ 'component_type': {
      \   'gitdiff': 'middle',
      \ },
      \ }


"set things
set noshowmode
set tabstop=4
set shiftwidth=4
set expandtab
set number "show line numbers
set laststatus=2 "for airline
set t_Co=256
set hidden
set backspace=2
set autoindent
set smartindent

set cursorline
set noswapfile
set nobackup
set scrolloff=2
set lazyredraw
set splitbelow
set splitright
set updatetime=100

set encoding=utf8
set termencoding=utf-8
set fileencodings=          " Don't do any encoding conversion


"search
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set smartcase  " ignore case if search pattern is all lowercase,
               "   case-sensitive otherwise
set ignorecase " ignore case when searching
set list "nice to have
set pastetoggle=<F2> "pastetoggle
set mouse=n "set mouse


" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif


"For proper tabbing and bracket insertion"
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>


"select all, copy clipboard
map <C-a> <esc>ggVG<CR>

"tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" clever tab
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"cursor
autocmd InsertEnter,InsertLeave * set cul!

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

