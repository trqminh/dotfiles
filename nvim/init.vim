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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'williamboman/mason.nvim',              { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'                      " completion UI
Plug 'hrsh7th/cmp-nvim-lsp'                  " LSP source
Plug 'L3MON4D3/LuaSnip'                      " snippet engine
Plug 'saadparwaiz1/cmp_luasnip'              " cmp ↔ LuaSnip


" theme
Plug 'craftzdog/solarized-osaka.nvim'
Plug 'yobibyte/helix-nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'ishan9299/nvim-solarized-lua'

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
autocmd FileType * setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smarttab

set number
set hlsearch
set ruler
set noswapfile
set nobackup
set nofixendofline
set lazyredraw
set showtabline=2
set cursorline
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
vim.keymap.set("i", ";;", "<Esc>:w<CR>")
vim.keymap.set("n", ";;", ":w<CR>")
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

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
EOF


" GITSIGNS WITH STATUSCOLUMN (Fixed)
lua << EOF
require('gitsigns').setup({
  -- Enable signcolumn so gitsigns can place signs
  signcolumn = true,
  numhl = false,
  linehl = false,
  
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '▸' },
    topdelete    = { text = '‾' },
    changedelete = { text = '┃' },
  },
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

-- Use statuscolumn to reorder: line numbers first, then signs
-- %l = line numbers, %s = signs (including git signs)
vim.opt.statuscolumn = "%l %s"

-- Customize the highlight colors for git signs
vim.cmd [[
  highlight GitSignsAdd guifg=#48A860 ctermfg=Green
  highlight GitSignsChange guifg=#FADA5E ctermfg=Yellow  
  highlight GitSignsDelete guifg=#ff0000 ctermfg=Red
  highlight GitSignsTopDelete guifg=#ff0000 ctermfg=Red
  highlight GitSignsChangeDelete guifg=#ff0000 ctermfg=Red
]]
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
  ensure_installed = {'cpp', 'python', 'bash'},
  highlight = {
    enable = true, -- Enable Treesitter-based highlighting
  },
}
EOF

" LSP + COMPLETION SETUP
lua << EOF
-- Mason
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'pyright' }
}

-- nvim-cmp
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-y>']  = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
}

-- Helper that grabs *the first python in $PATH* (= active env)
local function python_path()
  return vim.fn.exepath('python') or 'python'
end
-- reddit tip: use it for python.pythonPath :contentReference[oaicite:1]{index=1}

-- LSP server setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig    = require('lspconfig')

lspconfig.pyright.setup{
  capabilities = capabilities,
  on_new_config = function(new_cfg,_)
    new_cfg.settings = new_cfg.settings or {}
    new_cfg.settings.python = { pythonPath = python_path() }
  end,
  settings = {         -- keep Pyright fast
    python = { analysis = { diagnosticMode = 'openFilesOnly' } },
  },
}

-- Handy on-attach mappings (add more if you like)
local map = vim.keymap.set
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    map('n', 'gd',  vim.lsp.buf.definition,   { buffer = ev.buf })
    map('n', 'K',   vim.lsp.buf.hover,        { buffer = ev.buf })
    map('n', 'gr',  vim.lsp.buf.references,   { buffer = ev.buf })
    map('n', '<F2>',vim.lsp.buf.rename,       { buffer = ev.buf })
  end
})

vim.diagnostic.config({
  virtual_text = false,   -- Disable inline diagnostics
  signs = false,          -- Disable gutter signs
  underline = true,      -- Optional: disable underline
  update_in_insert = true,
  severity_sort = true,
})

vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
--   end
-- })

-- Add a toggle function for showing diagnostic, map it to <leader>te
local diagnostic_open = false
local float_win = nil

vim.keymap.set("n", "<leader>te", function()
  if diagnostic_open and float_win and vim.api.nvim_win_is_valid(float_win) then
    vim.api.nvim_win_close(float_win, true)
    diagnostic_open = false
  else
    float_win = vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
    diagnostic_open = true
  end
end, { desc = "Toggle diagnostic float" })

-- vim.fn.sign_define("DiagnosticSignError", {text = ">>", texthl = "DiagnosticSignError"})
-- vim.fn.sign_define("DiagnosticSignWarn",  {text = ">>", texthl = "DiagnosticSignWarn"})
-- vim.fn.sign_define("DiagnosticSignInfo",  {text = ">>", texthl = "DiagnosticSignInfo"})
-- vim.fn.sign_define("DiagnosticSignHint",  {text = ">>", texthl = "DiagnosticSignHint"})

vim.o.updatetime = 500

EOF

" INDENT BLANKLINE
lua << EOF
require("ibl").setup {
  scope = { enabled = false },
}
EOF
