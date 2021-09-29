"Map
let mapleader = " "
command WQ wq
command Wq wq
command W w
command Q q
inoremap <silent>{<CR> {<CR>}<esc>ko
inoremap <silent>( (<C-g>u
inoremap <silent>, ,<C-g>u
inoremap <silent>. .<C-g>u
inoremap <silent>[ [<C-g>u
inoremap <silent>{ {<C-g>u
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <leader>gs :Gstatus<CR>
"nnoremap gdh :diffget //2<CR> nnoremap gdl :diffget //3<CR>
nnoremap <silent><leader>e :Defx<CR>
nnoremap <silent><leader>t :ToggleTerm size=10 direction=horizontal<CR>
imap <Home> <Esc>^i
tnoremap <Esc> <C-\><C-n>

"autocompe
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

"defx
autocmd FileType defx call s:defx_keybinding()
function! s:defx_keybinding() abort
	:set cursorline
    nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ?
                \ defx#do_action('open_or_close_tree') :
                \ defx#do_action('drop')

    nnoremap <silent><buffer><expr> >
                \ defx#is_directory() ?
                \ defx#do_action('open') :
                \ defx#do_action('preview')

    nnoremap <silent><buffer><expr> < defx#do_action('cd', ['..'])

    " back to current directory
    nnoremap <silent><buffer><expr> ~ defx#do_action('cd', [getcwd()])

    nnoremap <silent><buffer><expr> I defx#do_action('toggle_ignored_files')

    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> dd defx#do_action('remove')
    nnoremap <silent><buffer><expr> yy defx#do_action('copy')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> a defx#do_action('new_file')
	nnoremap <silent><buffer><expr> A defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> mv defx#do_action('rename')
endfunction
