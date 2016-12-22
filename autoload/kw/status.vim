function! kw#status#get_comment(status) abort
    let default = ""
    if exists("g:kw_last_comments")
        let default = get(g:kw_last_comments, a:status, "")
        call kw#add_to_history("comment", default)
    endif
    let result = input("Comment: ", default, "customlist,kw#history#complete_comments")
    let g:kw_last_comments[a:status] = result
    call kw#add_to_history("comment", result)
    return result
endfunction

function! kw#status#set_status(ids, status) abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    for id in split(a:ids, ',')
        " FIXME: probably shouldn't assume g:kw_issue_ids exists
        if index(g:kw_issue_ids, id + 0) >= 0
            let g:kw_issues[id]["status"] = a:status
        endif
    endfor
endfunction

function! kw#status#update_status(ids, status, ...) abort
    call kw#status#set_status(a:ids, a:status)
    let comment = ""
    if a:0 < 1
        let comment = kw#status#get_comment(a:status)
    endif
    let params = {
        \ "ids" : a:ids,
        \ "status" : a:status,
        \ "comment" : comment,
        \ }
    let response = kw#request#request("update_status", params, "load")
    echo json_decode(response[0])["status_message"]
endfunction

function! kw#status#get_current_status(...) abort
    if !exists("g:kw_issues")
        return ""
    endif
    if a:0 > 0
        let issue = g:kw_issues[a:1]
    else
        let issue = g:kw_current_issue
    endif
    return issue["status"]
endfunction

function! kw#status#current_status(...) abort
    if a:0 > 0
        let id = a:1
    else
        let id = g:kw_current_issue_id
    endif
    let cur = kw#status#get_current_status(id)
    if empty(cur)
        echoerr "g:kw_current_issue is not set"
        return
    endif
    let new = input("Status: ", cur, "customlist,kw#history#complete_status")
    call kw#add_to_history("status", new)
    if cur !=? new
        call kw#status#update_status(id, new)
    endif
endfunction
