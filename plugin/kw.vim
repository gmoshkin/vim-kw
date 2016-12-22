"TODO: add completion for searchable queries
command! -nargs=* KWSearchQueries %d <bar> call kw#search_queries(1, <q-args>)
command! KWSearchLastQuery %d <bar> call kw#search_last_query() <bar> 1
command! KWSearchCode %d <bar> call kw#search_queries(1, "code")
command! KWLoadCode call kw#search_queries(1, "code")
command! KWLoadStatus call kw#search_queries(1, "code", "status")
command! -nargs=1 KWSetQuery let g:kw_searchquery=<q-args>
command! -nargs=* -complete=customlist,kw#complete_projects KWProject call kw#set_project(<q-args>)
command! KWSetSettings call kw#set_settings()
command! -nargs=* KWUpdateStatus call kw#update_status(<q-args>)
command! KWFix call kw#update_status(input("Id: ", g:kw_current_issue_id), "Fix")
command! KWNotAProblem call kw#update_status(input("Id: ", g:kw_current_issue_id), "Not a Problem")
command! KWParseIssue call kw#parse_issue(getline('.'))
command! KWNextIssue call kw#next_issue(1)
command! KWPrevIssue call kw#prev_issue(1)
command! -nargs=* -complete=customlist,kw#complete_issue_ids KWIssue call kw#get_issue(1, <q-args>)
command! KWCurrentStatus call kw#current_status()
command! KWShowIssues call kw#show_issues()
command! KWStats call kw#show_stats()
command! KWOpenIssues call kw#issues#open()

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
