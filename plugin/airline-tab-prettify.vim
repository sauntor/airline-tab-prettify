if !has('g:airline_tab_prettify_enabled')
    let g:airline_tab_prettify_enabled = 1
endif

if g:airline_tab_prettify_enabled == 0
    finish
endif

let g:airline#extensions#tabline#formatter = 'prettify'
