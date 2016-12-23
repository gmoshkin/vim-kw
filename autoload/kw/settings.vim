if !exists("g:kw_settings")
    let g:kw_settings = {
        \ "host": "localhost",
        \ "port": 8080,
        \ "user": "username",
        \ "project": "project",
        \ }
endif

function! kw#settings#set_host() abort
    let g:kw_settings["host"] = input("Hostname: ", g:kw_settings["host"])
endfunction

function! kw#settings#set_port() abort
    let g:kw_settings["port"] = input("Port: ", g:kw_settings["port"])
endfunction

function! kw#settings#set_user() abort
    let g:kw_settings["user"] = input("Username: ", g:kw_settings["user"])
endfunction

function! kw#settings#set_project(...) abort
    if a:0 > 0 && !empty(a:1)
        let project = a:1
    else
        let project = input("Project: ", g:kw_settings["project"], "customlist,kw#history#complete_projects")
    endif
    call kw#history#add("projects", project)
    let g:kw_settings["project"] = project
endfunction

function! kw#settings#set_settings() abort
    call kw#settings#set_host()
    call kw#settings#set_port()
    call kw#settings#set_user()
    call kw#settings#set_project()
endfunction
