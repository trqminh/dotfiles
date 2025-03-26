"Vim plug
set nocompatible              " required
filetype off                  " required

" --------------------------------
call plug#begin()

" git
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'lewis6991/gitsigns.nvim'

" code completetion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" theme
Plug 'craftzdog/solarized-osaka.nvim'
Plug 'yobibyte/helix-nvim'
Plug 'EdenEast/nightfox.nvim'

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

" indent
Plug 'lukas-reineke/indent-blankline.nvim'

" outline view
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'stevearc/aerial.nvim'

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
set cursorline
set relativenumber
set ls=0 " no last status line in nvim

" MOUSE AND CURSOR
set mouse=
set guicursor=n-v-c-i:block


" COLOR
highlight Comment ctermfg=green
set termguicolors
set background=dark
colorscheme solarized-osaka
hi clear CursorLine

" GENERAL KEY MAP
lua << EOF
vim.g.mapleader = ' '
EOF
inoremap jk <ESC>

" GIT BLAME Details
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

" COC-DEFINITION
nmap <silent> gd <Plug>(coc-definition)

" OIL
lua << EOF
require("oil").setup({
    view_options = {
      show_hidden = true,
    },
})
vim.keymap.set("n", "<C-b>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
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


" GITSIGNS
lua << EOF
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>td', gitsigns.toggle_deleted)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

  end,
})
EOF

" ARIAL
lua << EOF
require("aerial").setup({
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
  end,
})
vim.keymap.set("n", "<leader>fv", "<cmd>AerialToggle<CR>")
EOF

" TREESITTER
lua << EOF
local ts = require'nvim-treesitter.configs'

ts.setup {
  highlight = {
    enable = true, -- Enable Treesitter-based highlighting
  },
}
EOF
