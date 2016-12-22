function! kw#utils#complete(list, ArgLead)
    let tmp_list = copy(a:list)
    call filter(tmp_list, 'v:val =~ "^'.a:ArgLead.'"')
    return tmp_list
endfunction
