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

function! kw#open_in_browser(...) abort
    if !exists("g:kw_issues")
        echoerr "g:kw_issues is not set"
        return
    endif
    if a:0 > 0 && !empty(a:1)
        let issue = g:kw_issues[a:1]
    else
        let issue = g:kw_current_issue
    endif
    execute "!xdg-open ".fnameescape(issue["url"])
endfunction
