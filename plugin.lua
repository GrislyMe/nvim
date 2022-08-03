return require("packer").startup(function()

	use 'wbthomason/packer.nvim'

	-- call plug#begin('~/.local/share/nvim/plugins')
	use 'tomasr/molokai'
	use 'morhetz/gruvbox'

	-- auto complete
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'

	-- LSP
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'
	use 'ray-x/lsp_signature.nvim'

	-- file explore
	use {
		'Shougo/defx.nvim',
		config = 'vim.cmd[[UpdateRemotePlugins]]'
	}
	use 'kristijanhusak/defx-icons'
	use 'kristijanhusak/defx-git'

	-- status bar
	use 'majutsushi/tagbar'
	use 'vim-airline/vim-airline'

	-- language support
	use {
		'nvim-treesitter/nvim-treesitter',
		config = 'vim.cmd[[TSUpdate]]'
	}
	use 'rhysd/vim-clang-format'
	use {
		'instant-markdown/vim-instant-markdown',
		ft = {'markdown'},
		config = 'vim.cmd[[yarn install]]'
	}

	-- git
	-- use 'tpope/vim-fugitive'

	-- maven
	-- Plug 'mikelue/vim-maven-plugin'

	-- terminal
	use 'akinsho/nvim-toggleterm.lua'

	-- other
	use 'mhinz/vim-startify'
end)

--call plug#end()
--"Set Vim-Plug

--"Set LSP & autocomplete
--"set completeopt=menu,menuone,noinsert
--"Set LSP & autocomplete

--"Set tagbar
--set tags=./tags,./TAGS,tags;~,TAGS;~
--let g:tagbar_ctags_bin = '/usr/bin/ctags'
--let g:tagbar_width=30
--let g:tarbar_left=1
--"Set tagbar

--"airline
--let g:airline#extensions#tabline#enabled = 1
--let g:airline_powerline_fonts = 1
--let g:airline_section_b = ' %{fugitive#statusline()}'
--"airline

--"set clang format
--autocmd FileType c,cpp,objc ClangFormatAutoEnable
--let g:clang_format#detect_style_file=1
--let g:clang_format#enable_fallback_style=0
--"set clang format
--
--let g:python_highlight_all=1
