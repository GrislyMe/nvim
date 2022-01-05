let mapleader = " "
command W :call VSCodeNotify('workbench.action.files.save')
command Q :call VSCodeNotify('workbench.action.closeActiveEditor')

"nav
nnoremap <leader>j :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <leader>j :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <leader>k :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <leader>k :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <leader>h :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <leader>h :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <leader>l :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <leader>l :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap <leader>e :call VSCodeNotify('workbench.view.explorer')<CR>
nnoremap <leader>ej :call VSCodeNotify('cursorDown')<CR>
nnoremap <leader>ek :call VSCodeNotify('cursorUp')<CR>
nnoremap <leader>el :call VSCodeNotify('cursorRight')<CR>

nnoremap <leader>gs :Gstatus<CR>
"nnoremap gdh :diffget //2<CR>
"nnoremap gdl :diffget //3<CR>
map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
map <F5> :split<CR> :wincmd j<CR> :term<CR> :resize 10<CR>
map <C-a> gg=G<CR>
imap <Home> <Esc>^i
tnoremap <Esc> <C-\><C-n>
"FZF map
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>f? :GFiles?<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fc :Commits<CR>
"FZF map
"Map
