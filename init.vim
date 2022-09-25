source $HOME/.config/nvim/nvim_tree_setup.lua
source $HOME/.config/nvim/basic.lua
source $HOME/.config/nvim/keybinding.lua
source $HOME/.config/nvim/plugin.lua
source $HOME/.config/nvim/complete-config.vim
source $HOME/.config/nvim/treesitter.lua
source $HOME/.config/nvim/terminal.lua
source $HOME/.config/nvim/welcome.vim

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

colorscheme gruvbox

"remove unwanted space
command RSpace :%s/\s\+$//e
"remove unwanted space

"hexReader
command HexReader :%!xxd
"hexReader

"binaryReader
command BinReader :%!xxd -R
"binaryReader
