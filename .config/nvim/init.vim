" ----------------------------------
" General
" ----------------------------------

:set number
:set relativenumber
:set smarttab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set autoindent
:set encoding=UTF-8
:set cc=80
:set nohlsearch
:set splitbelow          " Horizontal split below current.
:set splitright          " Vertical split to right of current.

let mapleader = ' '

" ----------------------------------
"  Plugins
" ----------------------------------

call plug#begin()

" Look
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'

" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope / fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
  
" cmp plugins
Plug 'hrsh7th/cmp-buffer' " buffer completions
Plug 'hrsh7th/cmp-path' " path completions
Plug 'hrsh7th/cmp-cmdline' " cmdline completions
Plug 'saadparwaiz1/cmp_luasnip' " snippet completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

" snippets
Plug 'L3MON4D3/LuaSnip' "snippet engine
Plug 'rafamadriz/friendly-snippets' " a bunch of snippets to use

" Tabs
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'

call plug#end()

" ----------------------------------
"  Lua
" ----------------------------------

lua << EOF
require('lsp')
require('autocompletion')
require('treesitter')
require("lualine").setup {}
require("tabline").setup {
    enable=false
}
require("lualine").setup {
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
    }
}
EOF

" ----------------------------------
"  Mappings
" ----------------------------------

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)

nnoremap <LEADER><LEADER> <cmd>Telescope live_grep theme=ivy<cr>
nnoremap <LEADER>fg <cmd>Telescope buffers<cr>

" ----------------------------------
"  Colorscheme
" ----------------------------------

set termguicolors
let ayucolor="mirage"
colorscheme ayu

