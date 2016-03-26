" A simple script to make airline integrated with nerdtree-tabs and tagbar look better
let s:tuples = get(g:, 'AirlineTabPrettyTuples', {})

let s:nerd_key = 'NERD_tree_\d\+'
let s:tag_key = '__Tagbar__'
let s:tuples[s:nerd_key] = 'Explorer'
let s:tuples[s:tag_key] = 'Symbols'

function! airline#extensions#tabline#formatters#pretty#format(bufnr, buffers)
    let label = airline#extensions#tabline#formatters#default#format(a:bufnr, a:buffers)
    for tk in keys(s:tuples)
        if label =~# tk
            let tv = s:tuples[tk]
            let tt = type(tv)
            if tt == 0 || tt == 1 || tt == 5
                return tv
            elseif tt == 2
                return call tv(label)
            else
                echoerr 'g:AirlineTabPrettyTuples does not support list or dict value'
            endif
        endif
    endfor
    return label
endfunction

function! airline#extensions#tabline#formatters#pretty#set_nerdtree_name(name)
    let s:tuples[s:nerd_key] = a:name
endfunction

function! airline#extensions#tabline#formatters#pretty#set_tagbar_name(name)
    let s:tuples[s:tag_key] = a:name
endfunction


