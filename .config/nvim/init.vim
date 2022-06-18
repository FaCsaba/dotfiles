" ---------------------- 
"  General settings
" ----------------------

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set noexpandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=80
filetype plugin indent on
syntax on
set clipboard=unnamedplus
set ttyfast
set path=.,,**
set relativenumber

let mapleader=' '

" ----------------------
"  Plugins
" ----------------------

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'sainnhe/gruvbox-material'
Plug 'akinsho/toggleterm.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
call plug#end()

colorscheme gruvbox-material

" ----------------------
"  Lua requires
" ----------------------

lua << EOF
require("tt")
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
lspinstaller = require("nvim-lsp-installer")
lspinstaller.setup {}
as = lspinstaller.get_installed_servers()
for k,v in ipairs(as) do
	vim.pretty_print(v.name)
	require("lspconfig")[v.name].setup {}
end
EOF

" ----------------------
"  Keymapping
" ----------------------

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-> :wincmd l<CR>

" Tab behaviour
nmap <silent> <tab> :TablineBufferNext<CR> 
nmap <silent> <s-tab> :TablineBufferPrevious<CR>

" Telescope
nmap <silent> <leader><leader> :Telescope current_buffer_fuzzy_find<CR> 

" NERDTree
nmap <silent> <leader><esc> :NERDTreeToggle<CR>
