" Added for Vundle
set nocp
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 插件管理
Plugin 'gmarik/Vundle.vim'
" Dash（:Dash激活）
Plugin 'rizzatti/dash.vim'
" Git集成
Plugin 'tpope/vim-fugitive'
" 快速注释（gc注释/取消）
Plugin 'tpope/vim-commentary'
" 状态栏（set laststatus=2显示）
Plugin 'vim-airline/vim-airline'
" MATLAB
Plugin 'djoshea/vim-matlab'
Plugin 'djoshea/vim-matlab-fold'
" 自动对齐 例如:Tab /|
Plugin 'godlygeek/tabular'
" 增加删除修改括号和引号
Plugin 'tpope/vim-surround'
" 自动补括号
Plugin 'AutoClose'
" HTML必备，按<C-Y>,激活
Plugin 'mattn/emmet-vim'
" coffeescript
Plugin 'kchmck/vim-coffee-script'
" 树状显示文件
Plugin 'The-NERD-tree'
" 切换.c和.h
Plugin 'a.vim'
"
Plugin 'L9'
" C/C++/Python/js补全
Plugin 'Valloric/YouCompleteMe'
" Solarized: 非常流行的配色。
Plugin 'altercation/vim-colors-solarized'
" Markdown
Plugin 'tpope/vim-markdown'
" 一键运行脚本
Plugin 'ironcamel/vim-script-runner'

call vundle#end()
filetype plugin indent on



set nocp
set nobk                " 不要生成备份文件
syntax on               " 语法高亮
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab           " 用空格代替Tab
set nu                  " 显示行号
set smartindent         " 自动缩进
"set ruler               " 显示光标位置（被插件取代）
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul
set showcmd
set backspace=indent,eol,start   "这指明在插入模式下在哪里允许<BS>删除光标前面的字符。
" 逗号分隔的三个值分别指：行首的空白字符，换行符和插入模式开始处之前的字符。

" 解决Windows下中文乱码
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

" =================================================
" airline
" =================================================
set laststatus=2

" =================================================
" YouCompleteMe
" =================================================
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1

" =================================================
" NERDTree
" =================================================
map <C-n> :NERDTreeToggle<CR>

" =================================================
" 自定义脚本
" =================================================
let g:script_runner_key = '<F6>'

function CompileAndRun()
    exec "w"
	let ext = ''
	if &filetype == 'c'
    	exec "!clang % -o %<"
		let ext = 'exe'
	elseif &filetype == 'cpp'
		exec "!clang++ % -o %<"
		let ext = 'exe'
	elseif &filetype == 'pas'
		exec "!fpc %"
		let ext = 'exe'
	elseif &filetype == 'tex'
        exec "\ll"
        exec "\lv"
	elseif &filetype == 'python'
		exec "!python3.5 %"
	elseif &filetype == 'ruby'
		exec "!ruby %"
	elseif &filetype == 'javascript'
		exec "!node %"
	elseif &filetype == 'sh'
		exec "!chmod u+x %"
		exec "!./%"
	endif
	
	if ext == 'exe'
		exec "!./%<"
	endif
endfunction

function Debug()
    exec "w"
	let ext = ''
	if &filetype == 'c'
    	exec "!clang % -o %< -g"
		let ext = 'exe'
	elseif &filetype == 'cpp'
		exec "!clang++ % -o %< -g"
		let ext = 'exe'
	elseif &filetype == 'pas'
		exec "!fpc % -g"
		let ext = 'exe'
	elseif &filetype == 'tex'
        exec "\ll"
        exec "\lv"
        "exec '!pdflatex  -synctex=0 -interaction=nonstopmode %'
		"let ext = 'pdf'
        "exec "@<Plug>Tex_Compile"
	elseif &filetype == 'sh'
		exec "!chmod u+x %"
		exec "!./%"
	elseif &filetype == 'python'
		exec "!python %"
	endif
	
	if ext == 'exe'
	    exec "!lldb ./%<"
	endif
endfunction

map <F9> :call CompileAndRun()<CR>
map <F5> :call Debug()<CR>


function SetSmallWindow()
	set lines=30
	set columns=60
	exec "redr"
endfunction

function SetBigWindow()
	set lines=40
	set columns=120
	exec "redr"
endfunction
map \w :call SetSmallWindow()<CR>
map \f :call SetBigWindow()<CR>

map \i :5split %<.in<CR>
map \o :5split %<.out<CR>

map \r :redr!<CR>

map \y :1<CR>VG"+y

