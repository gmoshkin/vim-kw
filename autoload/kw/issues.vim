if !exists("g:kw_issues_max_height")
    let g:kw_issues_max_height = 20
endif

function! kw#issues#update_buffer(lastpos) abort
    if a:lastpos
        let pos = [ line('.'), col('.') ]
    else
        let pos = [ g:kw_current_issue_index + 1, 1 ]
    endif
    let issues = kw#get_issues()
    setlocal modifiable
    %delete
    call append(0, issues)
    $delete
    setlocal nomodifiable
    call cursor(pos)
endfunction

function! kw#issues#set_options() abort
    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nowrap
    setlocal previewwindow
    setlocal nomodifiable
    setlocal nomodified
endfunction

function! kw#issues#goto_issue() abort
    let index = line('.') - 1
    wincmd p
    call kw#select_issue(index, 1)
    pclose
endfunction

function! kw#issues#this_issue_id() abort
    if !exists("g:kw_issue_ids")
        echoerr "g:kw_issue_ids is not set"
        return
    endif
    return g:kw_issue_ids[line('.') - 1]
endfunction

function! kw#issues#change_status() abort
    let id = kw#issues#this_issue_id()
    call kw#current_status(id)
    call kw#issues#update_buffer(1)
endfunction

function! kw#issues#set_mappings() abort
    nnoremap <buffer> <CR> :<C-U>call kw#issues#goto_issue()<CR>
    nnoremap <buffer> cs :<C-U>call kw#issues#change_status()<CR>
endfunction

function! kw#issues#open() abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    pclose
    let height = min([len(g:kw_issues), g:kw_issues_max_height])
    execute "belowright ".height."new kwissues"
    call kw#issues#update_buffer(0)
    setfiletype kwissues
    call kw#issues#set_options()
    call kw#issues#set_mappings()
    redraw
endfunction
