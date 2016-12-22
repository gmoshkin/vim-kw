function! kw#complete_issue_ids(ArgLead, CmdLine, CursorPos) abort
    let tmp_list = kw#utils#complete(get(g:, "kw_issue_ids", []), a:ArgLead)
    call map(tmp_list, 'v:val.""')
    return tmp_list
endfunction

function! kw#parse_issues(issues) abort
    let g:kw_issues = {}
    for i in a:issues
        let issue = json_decode(i)
        let g:kw_issues[issue["id"]] = issue
    endfor
    let g:kw_issue_ids = sort(map(keys(g:kw_issues), 'v:val + 0'))
    if len(g:kw_issue_ids) > 0
        let g:kw_current_issue_index = 0
        let g:kw_current_issue_id = g:kw_issue_ids[g:kw_current_issue_index]
        call kw#parse_issue(g:kw_issues[g:kw_current_issue_id])
    endif
    echo 'Loaded '.len(g:kw_issues).' issues. Current issue id is '.g:kw_current_issue_id
endfunction

function! kw#parse_trace(trace) abort
    if empty(a:trace)
        return []
    endif
    let res = []
    let file = a:trace["file"]
    let entity = a:trace["entity"]
    for l in a:trace["lines"]
        let err = {
            \ "filename" : file,
            \ "lnum" : l["line"],
            \ "text" : l["text"],
            \ "type" : "Error",
            \ "nr" : -1,
            \ "entity" : entity,
            \ }
        call add(res, err)
        let trace = get(l, "trace", {})
        call extend(res, kw#parse_trace(trace))
    endfor
    return res
endfunction

function! kw#parse_issue(...) abort
    if a:0 < 1
        if !exists("g:kw_current_issue")
            echoerr "g:kw_current_issue doesn't exist"
            return
        else
            let issue = g:kw_current_issue
        endif
    else
        let issue = a:1
        if type(a:1) == v:t_string
            let issue = json_decode(a:1)
        endif
        let g:kw_current_issue = issue
        let g:kw_current_issue_id = issue["id"]
    endif
    let qf_list = []
    let err = {
        \ "filename" : issue["file"],
        \ "lnum" : issue["line"],
        \ "text" : issue["message"],
        \ "type" : "Error",
        \ "nr" : -1,
        \ }
    call add(qf_list, err)
    for t in issue["trace"]
        call extend(qf_list, kw#parse_trace(t))
    endfor
    "TODO: use the gutter to mark lines from the trace
    call setqflist(qf_list)
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
    call kw#parse_issue(g:kw_issues[g:kw_current_issue_id])
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
