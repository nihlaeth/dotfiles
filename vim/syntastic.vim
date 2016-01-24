" Syntastic setup - static syntax checking
let g:syntastic_python_checkers = ['pylint', 'pep8', 'pep257']
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_cpplint_exec = 'cpplint'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1


