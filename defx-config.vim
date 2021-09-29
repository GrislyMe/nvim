if exists('g:config_defx')
    finish
endif
let g:config_defx = 1

call defx#custom#column('git', 'show_ignored', 0)
call defx#custom#column('git', 'raw_mode', 1)

call defx#custom#option('_', {
            \ 'columns': 'indent:git:space:icons:space:filename:type',
            \ 'split': 'vertical',
            \ 'winwidth': 30,
            \ 'direction': 'topleft',
            \ 'resume': v:false,
            \ 'toggle': v:true
            \ })

