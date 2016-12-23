if !exists("g:kw_last_comments")
    let g:kw_last_comments = g:kw_comments
endif

if !exists("g:kw_statuses")
    let g:kw_statuses = [ "Fix", "Not a problem", "Fix in Next Release" ]
endif

if !exists("g:kw_history")
    let g:kw_history = {
            \ "status" : get(g:, "kw_statuses", []),
            \ "comments" : [],
            \ "projects" : get(g:, "kw_projects", []),
        \ }
endif

function! kw#history#complete_projects(ArgLead, CmdLine, CursorPos) abort
    return kw#utils#complete(get(g:kw_history, "projects", []), a:ArgLead)
endfunction

function! kw#history#complete_comments(ArgLead, CmdLine, CursorPos) abort
    return kw#utils#complete(get(g:kw_history, "comments", []), a:ArgLead)
endfunction

function! kw#history#complete_status(ArgLead, CmdLine, CursorPos) abort
    return kw#utils#complete(get(g:kw_history, "status", []), a:ArgLead)
endfunction

function! kw#history#add(type, value) abort
    " TODO: sort the entries by time
    let history = get(g:kw_history, a:type, [])
    if !empty(a:value) && index(history, a:value) < 0
        call add(history, a:value)
        let g:kw_history[a:type] = history
    endif
endfunction
