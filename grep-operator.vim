nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let ft = expand('%:e')
    let unnamed_reg = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else 
        return
    endif

     silent execute "grep -R " . shellescape(@@) . " . --include='*." . ft . "'"
    copen
    
    let @@ = unnamed_reg
endfunction




