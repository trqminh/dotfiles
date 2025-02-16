"Vim plug
set nocompatible              " required
filetype off                  " required

" --------------------------------
call plug#begin()

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'

" code completetion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" theme
Plug 'tpope/vim-vividchalk'
Plug 'craftzdog/solarized-osaka.nvim'

" indent
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'v2.20.6' }

" explorer
Plug 'nvim-lua/plenary.nvim' "ntree prerequisite
Plug 'nvim-tree/nvim-web-devicons' "ntree prerequisite
Plug 'MunifTanjim/nui.nvim' "ntree prerequisite
Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v2.x' }
Plug 'stevearc/oil.nvim'

" search
Plug '~/.fzf'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }

call plug#end()
"----------------------------------------------------------
"----------------------------------------------------------

" OPTIONS
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set hlsearch
set ruler
set autoindent
set noswapfile
set nobackup
set nofixendofline
set lazyredraw
set showtabline=2
set ls=0 " no last status line in nvim
"set cursorline
"set updatetime=100

" MOUSE AND CURSOR
set mouse=a
set guicursor=n-v-c-i:block


" COLOR
highlight Comment ctermfg=green
set termguicolors
set background=dark
colorscheme solarized-osaka

" GENERAL KEY MAP
lua << EOF
vim.g.mapleader = ' '
EOF
inoremap jk <ESC>

" GITGUTTER SIGNS
let g:gitgutter_sign_added    = '┃'
let g:gitgutter_sign_modified = '┋'

" GIT BLAME
" set cmdheight=2 " better view git blame
" autocmd CursorMoved * :call gitblame#echo()
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" TREE CONFIG
nnoremap - :Neotree float reveal<CR>
nnoremap <Leader>g :Neotree float git_status<CR>

" SEARCH 
" nnoremap <C-p> :FZF<CR>
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" OIL
lua << EOF
require("oil").setup({
    view_options = {
      show_hidden = true,
    },
})
vim.keymap.set("n", "<C-b>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
EOF

" HARPOON
lua << EOF
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
EOF

