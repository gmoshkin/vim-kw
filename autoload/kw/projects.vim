function! kw#projects#show(projects) abort
    echo "Projects:"
    for p in a:projects
        echo p["name"]." : ".p["description"]." [creator: ".p["creator"]."]"
    endfor
endfunction

function! kw#projects#load() abort
    let response = kw#request#request("projects", {}, "load")
    call kw#parse#projects(response)
    call kw#projects#show(g:kw_projects)
endfunction
