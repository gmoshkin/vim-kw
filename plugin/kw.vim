"TODO: add completion for searchable queries
command! -nargs=* KWSearchQueries %d <bar> call kw#query#search_queries(1, <q-args>)
command! KWSearchCode %d <bar> call kw#query#search_queries(1, "code")
command! KWLoadId call kw#query#search_queries(1, "id")
command! KWLoadCode call kw#query#search_queries(1, "code")
command! KWLoadStatus call kw#query#search_queries(1, "code", "status")
command! KWLoadProjects call kw#projects#load()
command! KWSearchLastQuery %d <bar> call kw#query#search_last_query() <bar> 1

command! -nargs=* -complete=customlist,kw#history#complete_projects KWProject call kw#settings#set_project(<q-args>)
command! KWSetSettings call kw#settings#set_settings()

command! -nargs=* KWUpdateStatus call kw#status#update_status(<q-args>)
command! KWFix call kw#status#update_status(input("Id: ", g:kw_current_issue_id), "Fix")
command! KWNotAProblem call kw#status#update_status(input("Id: ", g:kw_current_issue_id), "Not a Problem")
command! KWCurrentStatus call kw#status#current_status()

command! KWParseIssue call kw#parse#issue(getline('.'))

command! KWNextIssue call kw#issues#next(1)
command! KWPrevIssue call kw#issues#prev(1)
" command! KWNextAnalyze call kw#next_analyze(1)
" command! KWPrevAnalyze call kw#prev_analyze(1)
command! -nargs=* -complete=customlist,kw#issues#complete_ids KWIssue call kw#issues#get(1, <q-args>)

command! KWStats call kw#show_stats()
command! -nargs=* -complete=customlist,kw#issues#complete_ids KWOpenInBrowser call kw#open_in_browser(<q-args>)
command! KWShowIssues call kw#issues#show()
command! KWOpenIssues call kw#issuesbuf#open()

nnoremap <silent> <leader>kwf :<C-U>KWFix<CR>
nnoremap <silent> <leader>kwn :<C-U>KWNotAProblem<CR>
nnoremap <silent> <leader>kwl :<C-U>KWSearchLastQuery<CR>
nnoremap <silent> <leader>kwc :<C-U>KWLoadCode<CR>
nnoremap <silent> <leader>kws :<C-U>KWCurrentStatus<CR>
nnoremap <silent> <leader>kw> :<C-U>KWNextIssue<CR>
nnoremap <silent> <leader>kw< :<C-U>KWPrevIssue<CR>
nnoremap <silent> <leader>kwo :<C-U>KWOpenIssues<CR>
nnoremap <silent> <leader>kwp :<C-U>KWParseIssue<CR>
nnoremap <silent> <leader>kw? :<C-U>KWShowIssues<CR>
nnoremap <silent> <leader>kwi :<C-U>KWIssue<CR>
nnoremap <silent> ]K :<C-U>KWNextIssue<CR>
nnoremap <silent> [K :<C-U>KWPrevIssue<CR>
