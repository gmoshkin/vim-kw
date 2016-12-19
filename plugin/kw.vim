command! -nargs=1 KWFetchIssues %d | read !curl --data "action=search&user=gmoshkin&project=cudafy&query=<args>" http://localhost:9090/review/api
"TODO: add completion for searchable queries
command! -nargs=* KWSearchQueries %d <bar> call kw#search_queries(<q-args>)
command! KWSearchLastQuery %d <bar> call kw#search_last_query() <bar> 1
command! KWSearchCode %d <bar> call kw#search_queries("code")
command! KWLoadCode call kw#load_queries("code")
command! -nargs=1 KWSetQuery let g:kw_searchquery=<q-args>
command! KWSetSettings call kw#set_settings()
command! -nargs=* KWUpdateStatus call kw#update_status(<q-args>)
command! KWFix call kw#update_status(input("Id: ", g:kw_current_issue_id), "Fix")
command! KWNotAProblem call kw#update_status(input("Id: ", g:kw_current_issue_id), "Not a Problem")
command! KWParseIssue call kw#parse_issue(getline('.'))
command! KWParseNext call kw#parse_next()
command! KWParsePrev call kw#parse_prev()
command! KWCurrentStatus call kw#current_status()
command! KWStats echo kw#get_stats()

nnoremap <leader>kwf :<C-U>KWFix<CR>
nnoremap <leader>kwn :<C-U>KWNotAProblem<CR>
nnoremap <leader>kwl :<C-U>KWSearchLastQuery<CR>
nnoremap <leader>kwc :<C-U>KWLoadCode<CR>
nnoremap <leader>kws :<C-U>KWCurrentStatus<CR>
nnoremap <leader>kw> :<C-U>KWParseNext<CR>
nnoremap <leader>kw< :<C-U>KWParsePrev<CR>
nnoremap <leader>kwp :<C-U>KWParseIssue<CR>

augroup KWVim
    autocmd BufWritePost kw.vim source %
augroup END