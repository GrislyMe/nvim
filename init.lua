require('nvim_tree_setup')
require('basic')
require('keybinding')
require('plugin')
require('treesitter')
require('terminal')
require('complete_config')

vim.cmd("colorscheme gruvbox")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
