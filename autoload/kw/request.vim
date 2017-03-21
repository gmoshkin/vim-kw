function! kw#request#get_address_string() abort
    if !exists("g:kw_settings")
        echoerr "g:kw_settings is unset"
        return ""
    endif
    let address = "http://"
    let address .= g:kw_settings["host"].":".g:kw_settings["port"]
    let address .= "/review/api"
    return address
endfunction

function! kw#request#get_request_string(action, params) abort
    if !exists("g:kw_settings")
        echoerr "g:kw_settings is unset"
        return ""
    endif
    let params = []
    call add(params, "action=".a:action)
    call add(params, "user=".g:kw_settings["user"])
    if has_key(g:kw_settings, "ltoken")
        call add(params, "ltoken=".g:kw_settings["ltoken"])
    endif
    if a:action !=? "projects"
        call add(params, "project=".g:kw_settings["project"])
    endif
    for [k, v] in items(a:params)
        call add(params, k."=".substitute(v, " ", "+", "g"))
    endfor
    if index(keys(a:params), "owner") < 0
        call add(params, "owner=".g:kw_settings["user"])
    endif
    let request = join(params, "&")
    return request
endfunction

function! kw#request#send(request, ...) abort
    let address = kw#request#get_address_string()
    let prefix = ""
    let curl_options = ""
    if a:0 > 0
        if a:1 ==? "read"
            let execute = 1
            let prefix = "read !"
            let curl_options = "--stderr /dev/null"
        elseif a:1 ==? "load"
            let execute = 0
            let prefix = ""
            let curl_options = "--stderr /dev/null"
        endif
    else
        let prefix = "!"
        let execute = 1
    endif
    let cmd = prefix.'curl '.curl_options.' --data "'.a:request.'" '.address
    if exists("g:kw_debug") && g:kw_debug
        echo "executing '".cmd."'"
    endif
    if execute
        execute cmd
    else
        let g:kw_last_response = systemlist(cmd)
        return g:kw_last_response
    endif
endfunction

function! kw#request#request(action, params, result) abort
    let request = kw#request#get_request_string(a:action, a:params)
    let response = kw#request#send(request, a:result)
    return response
endfunction
