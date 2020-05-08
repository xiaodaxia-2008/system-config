inoremap jj <esc>
nnoremap <space> viw 
nnoremap , <leader>
set shiftwidth=4
set softtabstop=4
set clipboard+=unnamed
set encoding=utf-8
set pyxversion=3
set cursorline
set number
set tags=./.tags;,.tags
set autochdir 

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
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = "/usr/bin/python3"

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
nmap , <Leader>

let g:ale_completion_enabled=0
let g:ale_linters = {'c++': ['clang'], 'c': ['clang'], 'python': ['pylint', 'autopep8', 'mypy'],}
""ale
"""始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"""自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
""""在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"""显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"""<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
""""<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>


" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

 " path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-7/lib/libclang.so.1'

let g:solarized_contrast = "high"

let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp.objc ClangFormatAutoEnable

let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff = 1

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged", "CompleteDone"]

iabbrev @@ xiaozisheng2008@qq.com
iabbrev rvscppheader // Copyright (c) RVBUST, Inc - All rights reserved.
iabbrev rvspythonheader #!/usr/bin/python3\r\n# -*- coding: utf-8 -*-\r\n# Copyright (c) RVBUST, Inc - All rights reserved. 
