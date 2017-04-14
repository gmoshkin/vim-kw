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

function! kw#open_url(url) abort
    execute "!xdg-open ".fnameescape(a:url)." &>/dev/null"
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
    call kw#open_url(issue["url"])
endfunction

function! kw#look_up_checker(code) abort
    let l:url = "https://support.roguewave.com/documentation/klocwork/en/2017/"
    let l:url .= a:code
    call kw#open_url(l:url)
endfunction
