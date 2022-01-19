if exists('g:vscode')
	source $HOME/.config/nvim/vsKeybinding.vim
else
	source $HOME/.config/nvim/keybinding.vim
source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/defx-config.vim
source $HOME/.config/nvim/complete-config.vim
source $HOME/.config/nvim/treesitter.lua
source $HOME/.config/nvim/neovide.vim
source $HOME/.config/nvim/welcome.vim
source $HOME/.config/nvim/terminal.lua
colorscheme gruvbox
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

endif

source $HOME/.config/nvim/basic.lua

"remove unwanted space
command RSpace :%s/\s\+$//e
"remove unwanted space

"hexReader
command HexReader :%!xxd
"hexReader

"binaryReader
command BinReader :%!xxd -R
"binaryReader
