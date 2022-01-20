set nocompatible

call plug#begin('~/.local/share/nvim/plugins')
"colorScheme
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

"auto complete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"LSP
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'

"file explore
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

"status bar
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'

"language support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rhysd/vim-clang-format'

"git
Plug 'tpope/vim-fugitive'

"terminal
Plug 'akinsho/nvim-toggleterm.lua'

"other
Plug 'mhinz/vim-startify'

call plug#end()
"Set Vim-Plug

"Set LSP & autocomplete
set completeopt=menu,menuone,noinsert
"Set LSP & autocomplete

"Set tagbar
set tags=./tags,./TAGS,tags;~,TAGS;~
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width=30
let g:tarbar_left=1
"Set tagbar

"airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_section_b = ' %{fugitive#statusline()}'
"airline

"set clang format
autocmd FileType c,cpp,objc ClangFormatAutoEnable
let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=0
"set clang format

let g:python_highlight_all=1
