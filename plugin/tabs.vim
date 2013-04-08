if exists("g:loaded_vim_unexpanded_tabs") || v:version < 700
    finish
endif
let g:loaded_vim_unexpaneded_tabs = 1

let g:defaultListChars=&g:listchars
let g:defaultListSetting=&g:list

function! s:toggleTabsSetting()
    if &expandtab == 1
        let &list=g:defaultListSetting
        let &listchars=g:defaultListChars
        hi SpecialKey ctermbg=0 guibg=0
    endif

    if &expandtab == 0
        setlocal list " show tabs character
        setlocal listchars=tab:\ \ " show tabs as empty spaces 
        hi SpecialKey ctermbg=1 guibg=1 " set color red as background for tabs
    endif
endfunction

autocmd BufEnter * call s:toggleTabsSetting()
