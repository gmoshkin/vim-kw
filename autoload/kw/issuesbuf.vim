if !exists("g:kw_issues_max_height")
    let g:kw_issues_max_height = 20
endif

function! kw#issuesbuf#update(savepos) abort
    highlight! KWIssue ctermbg=3 ctermfg=0
    let issueline = g:kw_current_issue_index + 1
    if a:savepos
        let pos = [ line('.'), col('.') ]
    else
        let pos = [ issueline, 1 ]
    endif
    let issues = kw#issues#get_all(0)
    setlocal modifiable
    %delete
    call append(0, issues)
    $delete
    setlocal nomodifiable
    call cursor(pos)
    execute 'match KWIssue /\%'.issueline.'l/'
endfunction

function! kw#issuesbuf#select_issue() abort
    let index = line('.') - 1
    wincmd p
    call kw#issues#select(index, 1)
    pclose
endfunction

function! kw#issuesbuf#current_issue_id() abort
    if !exists("g:kw_issue_ids")
        echoerr "g:kw_issue_ids is not set"
        return
    endif
    return g:kw_issue_ids[line('.') - 1]
endfunction

function! kw#issuesbuf#change_status() abort
    let id = kw#issuesbuf#current_issue_id()
    call kw#status#current_status(id)
    call kw#issuesbuf#update(1)
endfunction

function! kw#issuesbuf#set_options() abort
    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nowrap
    setlocal previewwindow
    setlocal nomodifiable
    setlocal nomodified
endfunction

function! kw#issuesbuf#set_mappings() abort
    nnoremap <buffer> <CR> :<C-U>call kw#issuesbuf#select_issue()<CR>
    nnoremap <buffer> cs :<C-U>call kw#issuesbuf#change_status()<CR>
endfunction

function! kw#issuesbuf#open() abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    pclose
    let height = min([len(g:kw_issues), g:kw_issues_max_height])
    execute "belowright ".height."new kwissues"
    call kw#issuesbuf#update(0)
    setfiletype kwissues
    call kw#issuesbuf#set_options()
    call kw#issuesbuf#set_mappings()
    redraw
endfunction
