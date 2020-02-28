inoremap jj <esc>
nnoremap <space> viw 
nnoremap , <leader>
set shiftwidth=4
set softtabstop=4
set clipboard+=unnamed
set encoding=utf-8
"set pyxversion=3
set cursorline
set number
set tags+=tags;  
set autochdir 

" 自动更新ctags
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if getcwd() != "/"
        if filewritable("./tags")
            !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
            TlistUpdate
        endif
    endif
    execute ":cd " . curdir
endfunction
" normal 模式，F10更新ctags
nmap <F10> :call UpdateCtags()<CR>
" 文件变化时自动更新，会频繁更新，产生性能问题
"autocmd BufWritePost *.c,*.h,*.cpp call UpdateCtags()

so ~/.vim/plugins.vim
"NerdTree setting
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
	    \!exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"vim colors solarized setting
syntax enable
set background=dark
"colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_bold = 1

" deoplete setting{
"let g:deoplete#enable_at_startup = 1
"let g:python3_host_prog = "/usr/bin/python3"

"call deoplete#custom#option('omni_patterns', {
"\ 'python': '[^. *\t]\.\w*',
"\ 'java': '[^. *\t]\.\w*',
"\  'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
"\  'xhtml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
"\  'xml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
"\})
autocmd CompleteDone * silent! pclose!
set completeopt-=preview

"supertab setting
let g:SuperTabDefaultCompletionType = "<c-n>"
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

augroup Pythonsetting
    autocmd!
    autocmd FileType python map , <localleader>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<space><esc>
    autocmd FileType python setlocal completeopt-=preview
augroup END

"let g:ale_completion_enabled=0
"set pyxversion=3
"let g:ale_linters = {'c++': ['clang'], 'c': ['clang'], 'python': ['pylint', 'autopep8', 'mypy'],}
""ale
"""始终开启标志列
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0
""自定义error和warning图标
""let g:ale_sign_error = '✗'
""let g:ale_sign_warning = '⚡'
"""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
""let g:ale_echo_msg_error_str = 'E'
""let g:ale_echo_msg_warning_str = 'W'
""let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
""nmap <Leader>s :ALEToggle<CR>
"""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>



let g:solarized_contrast = "high"

iabbrev @@ xiaozisheng2008@qq.com
iabbrev rvscppheader // Copyright (c) RVBUST, Inc - All rights reserved.
iabbrev rvspythonheader #!/usr/bin/python3\r\n# -*- coding: utf-8 -*-\r\n# Copyright (c) RVBUST, Inc - All rights reserved. 
