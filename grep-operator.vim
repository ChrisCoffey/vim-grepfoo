nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    let unnamed_reg = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else 
        return
    endif

     silent execute "grep -R " . shellescape(@@) . " ."
    copen
    
    let @@ = unnamed_reg
endfunction




