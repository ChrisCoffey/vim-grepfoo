function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    let new_list[a:i] = a:val
    return new_list
endfunction

function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction

function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

function! FoldLeft(acc, fn, ls)
    for i in a:ls
        echom string(i)
        echom string(a:fn)
        call function(a:fn)(a:acc, i)
    endfor
    return a:acc
endfunction

function! FoldRight(acc, fn, ls)
    let rev = call Reversed(a:ls)
    let folded = call FoldLeft(a:acc, a:fn, rev)
    return folded
endfunction


function! RLambda(acc, e)
    let ee = call Reversed(a:e)
    call add(a:acc, ee)
endfunction
