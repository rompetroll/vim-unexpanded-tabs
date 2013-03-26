if exists("g:loaded_vim_unexpanded_tabs") || v:version < 700
    finish
endif
let g:loaded_vim_unexpaneded_tabs = 1

function! s:toggleTabsSetting()
    if &expandtab == 1
        setlocal list " show "invisible" chars like tabs and eol
        setlocal listchars=tab:▸\ ,trail:- " show tabs and trailing 
    endif

    if &expandtab == 0
        setlocal list " show "invisible" chars like tabs and eol
        setlocal listchars=tab:\ \ ,trail:- " show tabs and trailing 
    endif
endfunction

autocmd BufNewFile,BufReadPost,StdinReadPost * nested call s:toggleTabsSetting()
