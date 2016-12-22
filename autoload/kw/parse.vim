function! kw#parse#trace(trace) abort
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
        call extend(res, kw#parse#trace(trace))
    endfor
    return res
endfunction

function! kw#parse#issue(...) abort
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
        call extend(qf_list, kw#parse#trace(t))
    endfor
    "TODO: use the gutter to mark lines from the trace
    call setqflist(qf_list)
endfunction

function! kw#parse#issues(issues) abort
    let g:kw_issues = {}
    for i in a:issues
        let issue = json_decode(i)
        let g:kw_issues[issue["id"]] = issue
    endfor
    let g:kw_issue_ids = sort(map(keys(g:kw_issues), 'v:val + 0'))
    if len(g:kw_issue_ids) > 0
        let g:kw_current_issue_index = 0
        let g:kw_current_issue_id = g:kw_issue_ids[g:kw_current_issue_index]
        call kw#parse#issue(g:kw_issues[g:kw_current_issue_id])
    endif
    echo 'Loaded '.len(g:kw_issues).' issues. Current issue id is '.g:kw_current_issue_id
endfunction
