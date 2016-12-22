function! kw#complete_issue_ids(ArgLead, CmdLine, CursorPos) abort
    let tmp_list = kw#utils#complete(get(g:, "kw_issue_ids", []), a:ArgLead)
    call map(tmp_list, 'v:val.""')
    return tmp_list
endfunction

function! kw#prev_issue(jump) abort
    call kw#_next_issue(-1, a:jump)
endfunction

function! kw#next_issue(jump) abort
    call kw#_next_issue(+1, a:jump)
endfunction

function! kw#_next_issue(ofs, jump) abort
    let newindex = g:kw_current_issue_index + a:ofs
    if a:ofs > 0 && newindex > len(g:kw_issue_ids) - 1
        echo "Reached the last issue"
        return
    elseif a:ofs < 0 && newindex < 0
        echo "Reached the first issue"
        return
    endif
    call kw#select_issue(newindex, a:jump)
endfunction

function! kw#select_issue(index, jump) abort
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

function! kw#get_issue(jump, ...) abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    if a:0 > 0 && !empty(a:1)
        let id = a:1
    else
        let id = input("Id: ", g:kw_current_issue_id, "customlist,kw#complete_issue_ids")
    endif
    let index = index(g:kw_issue_ids, id + 0)
    if index < 0
        echoerr "no such issue"
        return
    endif
    call kw#select_issue(index, a:jump)
endfunction

function! kw#show_stats(...) abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    let stats = {}
    for d in values(g:kw_issues)
        let stats[d["status"]] = get(stats, d["status"], 0) + len(d["issueIds"])
    endfor
    let result = g:kw_current_issue["code"].": "
    for [ k, v ] in items(stats)
        let result .= k." - ".v."; "
    endfor
    return result
endfunction

function! kw#get_issues(echo) abort
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

function! kw#show_issues() abort
    let issues = kw#get_issues(1)
    echo join(issues, "\n")
endfunction
