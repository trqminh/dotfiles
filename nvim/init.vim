"Vim plug
set nocompatible              " required
filetype off                  " required

" --------------------------------
call plug#begin()
" search
Plug '~/.fzf'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'zivyangll/git-blame.vim'

" code completetion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" theme
Plug 'bluz71/vim-nightfly-colors', {'branch': 'legacy'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Tsuzat/NeoSolarized.nvim', { 'branch': 'master' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-vividchalk'
Plug 'tomasiser/vim-code-dark'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'v2.20.6' }
Plug 'craftzdog/solarized-osaka.nvim'

" Tree
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v2.x' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()
"----------------------------------------------------------
"----------------------------------------------------------

" OPTIONS
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set hlsearch
set ruler
set autoindent
set cursorline

set noswapfile
set nobackup
set nofixendofline
set lazyredraw
"set updatetime=100
highlight Comment ctermfg=green

" MOUSE AND CURSOR
set mouse=a
set guicursor=n-v-c-i:block


" COLOR
set termguicolors
set background=dark
colorscheme solarized-osaka-night


" KEY MAP
lua << EOF
vim.g.mapleader = ' '
EOF
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
inoremap jk <ESC>


" CLEVER TAB
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


" GITGUTTER SIGNS
let g:gitgutter_sign_added    = '┃'
let g:gitgutter_sign_modified = '┋'

if g:colors_name == 'vividchalk'
  highlight clear SignColumn
  highlight GitGutterAdd    guifg=#009900 ctermfg=2 ctermbg=0
  highlight GitGutterChange guifg=#bbbb00 ctermfg=3 ctermbg=0
  highlight GitGutterDelete guifg=#ff2222 ctermfg=1 ctermbg=0
endif

" GIT BLAME
set ls=0 " no last status line in nvim
" set cmdheight=2 " better view git blame
" autocmd CursorMoved * :call gitblame#echo()


" TREE CONFIG
nnoremap <C-b> :Neotree float reveal<CR>
nnoremap <Leader>g :Neotree float git_status<CR>

" TELESCOPE
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

