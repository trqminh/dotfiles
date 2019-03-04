"Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

"Youcompleteme
Plugin 'Valloric/YouCompleteMe'

"super search
Plugin 'kien/ctrlp.vim'

" added nerdtree
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"end of vundle
"----------------------------------

"close scratch after completion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"nerdtree conf
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p



"set
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

set encoding=utf8
set termencoding=utf-8
set fileencodings=          " Don't do any encoding conversion

"search
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set smartcase  " ignore case if search pattern is all lowercase,
               "   case-sensitive otherwise
set ignorecase " ignore case when searching

"nice to have
set list

" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif


"Color scheme
colorscheme atom-dark-256


"For proper tabbing and bracket insertion"
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>


"select all, copy clipboard
map <C-a> <esc>ggVG<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p


function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


"pastetoggle
set pastetoggle=<F2>
