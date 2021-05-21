"Vim plug
set nocompatible              " required
filetype off                  " required

" --------------------------------
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

" PLUGIN LIST HERE

"search
Plug '~/.fzf'

" themes
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'junegunn/seoul256.vim'
Plug 'rakr/vim-one'
Plug 'smallwat3r/vim-simplicity'
Plug 'crusoexia/vim-monokai'
Plug 'arzg/vim-colors-xcode'
Plug 'tomasiser/vim-code-dark'

" line
" Plug 'liuchengxu/eleline.vim'
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'
Plug 'niklaas/lightline-gitdiff'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" distraction-free
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" icon
Plug 'ryanoasis/vim-devicons'

" completion
Plug 'neoclide/coc.nvim'

" indent
Plug 'Yggdroot/indentLine'

call plug#end()
"----------------------------------

" Goyo and limelight configs
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" ----------------------------------------------------------

"nerdtree configs
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"color scheme
colo codedark

"terminal background
"hi Normal guibg=NONE ctermbg=NONE

" lightline config
let g:lightline = {
      \ 'colorscheme': 'seoul256',
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

" airline config
" let g:airline_theme='bubblegum'

"set things
set noshowmode
set tabstop=4
set shiftwidth=4
set expandtab
set number "show line numbers
set relativenumber "number line trick
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
set colorcolumn=90

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

