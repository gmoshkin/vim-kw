function! kw#issues#complete_ids(ArgLead, CmdLine, CursorPos) abort
    let tmp_list = kw#utils#complete(get(g:, "kw_issue_ids", []), a:ArgLead)
    call map(tmp_list, 'v:val.""')
    return tmp_list
endfunction

function! kw#issues#select(index, jump) abort
    let g:kw_current_issue_index = a:index
    let g:kw_current_issue_id = g:kw_issue_ids[g:kw_current_issue_index]
    call kw#parse#issue(g:kw_issues[g:kw_current_issue_id])
    if a:jump
        silent cfirst
    endif
    let message = "Issue id: ".g:kw_current_issue_id
    let message .= " (".(a:index + 1)."/".len(g:kw_issues).")"
    let message .= " [".kw#status#get_current_status()."]"
    let message .= " ".g:kw_current_issue["message"]
    echo message
endfunction

function! kw#issues#offset(ofs, jump) abort
    let newindex = g:kw_current_issue_index + a:ofs
    if a:ofs > 0 && newindex > len(g:kw_issue_ids) - 1
        echo "Reached the last issue"
        return
    elseif a:ofs < 0 && newindex < 0
        echo "Reached the first issue"
        return
    endif
    call kw#issues#select(newindex, a:jump)
endfunction

function! kw#issues#prev(jump) abort
    call kw#issues#offset(-1, a:jump)
endfunction

function! kw#issues#next(jump) abort
    call kw#issues#offset(+1, a:jump)
endfunction

function! kw#issues#get(jump, ...) abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    if a:0 > 0 && !empty(a:1)
        let id = a:1
    else
        let id = input("Id: ", g:kw_current_issue_id, "customlist,kw#issues#complete_ids")
    endif
    let index = index(g:kw_issue_ids, id + 0)
    if index < 0
        echoerr "no such issue"
        return
    endif
    call kw#issues#select(index, a:jump)
endfunction

function! kw#issues#get_all(echo) abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    let issues = []
    for d in values(g:kw_issues)
        let fields = [ d["code"], d["id"], d["status"] ]
        if d["id"] ==? g:kw_current_issue_id && a:echo
            call add(fields, "<---")
        endif
        call add(issues, join(fields, " "))
    endfor
    return sort(issues)
endfunction

function! kw#issues#show() abort
    let issues = kw#issues#get_all(1)
    echo join(issues, "\n")
endfunction
