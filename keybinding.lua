local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- space as leader key
vim.g.mapleader = " "

-- command WQ wq
vim.api.nvim_create_user_command('WQ', ':wq', {})
-- command Wq wq
vim.api.nvim_create_user_command('Wq', ':wq', {})
-- command W w
vim.api.nvim_create_user_command('W', ':w', {})
-- command Q q
vim.api.nvim_create_user_command('Q', ':q', {})

-- autoclose
vim.api.nvim_set_keymap('i', '{', '{}<C-o>i', {})
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<esc>ko', {})
vim.api.nvim_set_keymap('i', '(', '()<C-o>i', {})
vim.api.nvim_set_keymap('i', '[', '[]<C-o>i', {})

-- change focus
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', {})

-- toggle file mgr
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {})

-- floating terminal
vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', {})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})

-- misc
vim.api.nvim_set_keymap('i', '<Home>', '<Esc>^i', {})

-- swap between open tab
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', ':bp<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':bn<CR>', {})

-- close selected word
vim.api.nvim_set_keymap('x', '<', 'c<><Esc>P', {})
vim.api.nvim_set_keymap('x', '(', 'c()<Esc>P', {})
vim.api.nvim_set_keymap('x', '[', 'c[]<Esc>P', {})
vim.api.nvim_set_keymap('x', '{', 'c{}<Esc>P', {})
vim.api.nvim_set_keymap('x', '\'', 'c\'\'<Esc>P', {})
vim.api.nvim_set_keymap('x', '\"', 'c\"\"<Esc>P', {})

vim.api.nvim_set_keymap('x', '>', 'i<d<Esc>vhp', {})
vim.api.nvim_set_keymap('x', ')', 'i(d<Esc>vhp', {})
vim.api.nvim_set_keymap('x', ']', 'i[d<Esc>vhp', {})
vim.api.nvim_set_keymap('x', '}', 'i{d<Esc>vhp', {})

-- nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
-- nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
-- nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
-- nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
-- nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
-- autocmd FileType defx call s:defx_keybinding()

-- function defx_keybinding():
-- 	vim.api.nvim_command(set cursorline)
--  vim.api.nvim_set_keymap('x', '}', 'i{d<Esc>vhp', {})
-- 	nnoremap <silent><buffer><expr> <CR>
-- 				\ defx#is_directory() ?
-- 				\ defx#do_action('open_or_close_tree') :
-- 				\ defx#do_action('drop')
-- 
-- 	nnoremap <silent><buffer><expr> >
-- 				\ defx#is_directory() ?
-- 				\ defx#do_action('open') :
-- 				\ defx#do_action('preview')
-- 
-- 	nnoremap <silent><buffer><expr> < defx#do_action('cd', ['..'])
-- 
-- 	" back to current directory
-- 	nnoremap <silent><buffer><expr> ~ defx#do_action('cd', [getcwd()])
-- 
-- 	nnoremap <silent><buffer><expr> I defx#do_action('toggle_ignored_files')
-- 
-- 	nnoremap <silent><buffer><expr> p defx#do_action('paste')
-- 	nnoremap <silent><buffer><expr> dd defx#do_action('remove')
-- 	nnoremap <silent><buffer><expr> yy defx#do_action('copy')
-- 	nnoremap <silent><buffer><expr> q defx#do_action('quit')
-- 	nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
-- 	nnoremap <silent><buffer><expr> a defx#do_action('new_file')
-- 	nnoremap <silent><buffer><expr> A defx#do_action('new_directory')
-- 	nnoremap <silent><buffer><expr> mv defx#do_action('rename')
-- endfunction
