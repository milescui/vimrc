"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: miles <miles8.com@gmail.com>
" Last Change: 12/23/2009
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" init pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()



"Get out of VI's compatible mode..
set nocompatible
"Sets how many lines of history VIM har to remember
set history=400
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Platform
function! MySys()
	if has("win32") || has("win64")
    	return "windows"
	elseif has("mac")
		return "mac"
	else
    	return "linux"
  	endif
endfunction

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"缺省不产生备份文件
set nobackup 
set nowritebackup
" 不要生成swap文件
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set lbr
set nowrap
set wildmenu

set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]
"默认情况下根据语法文件指定的折叠
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running") || has("gui_macvim")
	colorscheme molokai
	let g:colors_name="molokai"
else
	colorscheme darkblue
endif

if MySys() == "mac"
	set guifont=TextMate_Regular:h14
	set guifontwide=Hei_Regular:h14
elseif MySys() == "windows"
	set guifont=Consolas:h11
elseif MySys() == "linux"
	set guifont=Monospace
endif

set anti
set linespace=2 
set number
set numberwidth=4
set equalalways
set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype and syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_enable_domhtmlcss=1
let g:xml_use_xhtml = 1 "for xml.vim
let xml_tag_completion_map="<C-l>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_macvim")

	set columns=171
	set lines=58
	winpos 52 42 

	let macvim_skip_cmd_opt_movement = 1
	let macvim_hig_shift_movement = 1

	set transparency=0
	set guioptions-=T "egmrt
	"set guioptions+=b 
	
	macm File.New\ Tab						key=<D-T>
	macm File.Save<Tab>:w					key=<D-s>
	macm File.Save\ As\.\.\.<Tab>:sav		key=<D-S>
	macm Edit.Undo<Tab>u					key=<D-z> action=undo:
	macm Edit.Redo<Tab>^R					key=<D-Z> action=redo:
	macm Edit.Cut<Tab>"+x					key=<D-x> action=cut:
	macm Edit.Copy<Tab>"+y					key=<D-c> action=copy:
	macm Edit.Paste<Tab>"+gP				key=<D-v> action=paste:
	macm Edit.Select\ All<Tab>ggVG			key=<D-A> action=selectAll:
	macm Window.Toggle\ Full\ Screen\ Mode	key=<D-F>
	macm Window.Select\ Next\ Tab			key=<D-}>
	macm Window.Select\ Previous\ Tab		key=<D-{>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd! bufwritepost .vimrc source ~/.vimrc
let g:jslint_neverAutoRun=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle quickfix window
function! QFSwitch()
	redir => ls_output
		execute ':silent! ls'
	redir END

	let exists = match(ls_output, "[Quickfix List")
	if exists == -1
		execute ':copen'
	else
		execute ':cclose'
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","
let g:mapleader=","

map <silent> <leader>rc :tabe ~/.vimrc<cr>
map <leader>q :q<cr>

map <silent> <F6> <ESC>:call QFSwitch()<CR>
map <silent> <F5> :make<CR>

nmap <tab> 		v>
nmap <s-tab> 	v<
vmap <tab> 		>gv 
vmap <s-tab> 	<gv

" Tab switch
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>

" map cmd to ctrl
if MySys() == "mac"
    " map :cn and :cp
    nmap <D-g> :cn<CR>
    nmap <D-G> :cp<CR>
endif

if MySys() == "windows"
    " map :cn and :cp
    nmap <M-g> :cn<CR>
    nmap <M-G> :cp<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miles setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase

"隐藏左边滚动条
set guioptions-=l
set guioptions-=L

"隐藏右边滚动条
set guioptions-=R
set guioptions-=r

" Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
		\set guioptions-=T <Bar>
		\set guioptions-=m <bar>
	\else <Bar>
		\set guioptions+=T <Bar>
		\set guioptions+=m <Bar>
	\endif<CR>


nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr> 

" Run
autocmd FileType python map <silent> <F4> <ESC>:!python %<CR>
autocmd FileType php map <silent> <F4> <ESC>:!php %<CR>

" dict complete
if MySys() == "windows"
    au FileType php setlocal dict+=$VIM/vimfiles/dict/php_complete_dict.txt
    au FileType python setlocal dict+=$VIM/vimfiles/dict/python_complete_dict.txt
else
    au FileType php setlocal dict+=~/.vim/dict/php_complete_dict.txt
    au FileType python setlocal dict+=~/.vim/dict/python_complete_dict.txt
endif

" PHP setting
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1

" Normal 模式下<C-j> <C-k>移动当前行到下1行或下1行
" Visual模式下<C-j> <C-k>移动当前选中的多行到下1行或下1行
nnoremap <C-k>  mz:m-2<cr>`z==
nnoremap <C-j>  mz:m+<cr>`z==
xnoremap <C-k>  :m'<-2<cr>gv=gv
xnoremap <C-j>  :m'>+<cr>gv=gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" taglists setting
nmap <silent> <leader>tl :TlistToggle<CR>
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu=1
let Tlist_Show_One_File=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_OnSelect=1
let Tlist_Compact_Format=1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
let Tlist_Inc_Winwidth = 0

let g:tlist_javascript_settings = 'javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'


" Tagbar setting
let g:tagbar_width = 30
nmap <silent> <leader>tb :TagbarToggle<CR>


" NERDTree setting
let NERDTreeIgnore=['\~$', '\.pyc$']
let NERDTreeWinSize=32
nmap <silent> <leader>nt :NERDTree<cr>


" Most Recently Used (MRU)
nmap <silent> <leader>r :MRU<cr>

" Command-T
let g:CommandTMaxHeight=20
map <D-d> :CommandT<CR>
imap <D-d> <C-O>:CommandT<CR>

" Sparkup
let g:sparkupExecuteMapping='<D-e>'
let g:sparkupNextMapping='<D-r>'

" Jsbeautify
nnoremap <silent> <leader>sf :call g:Jsbeautify()<cr>

" XPTemplate setting
let g:xptemplate_vars="$author=Miles&$email=milescui@gmail.com&$PHP_TAG=php&$SParg="
" *** supertab support ***
let g:xptemplate_brace_complete = 0
" avoid key conflict 
let g:SuperTabMappingForward = '<Plug>supertabKey' 
" if nothing matched in xpt, try supertab 
let g:xptemplate_fallback = '<Plug>supertabKey' 
" xpt uses <Tab> as trigger key 
let g:xptemplate_key = '<Tab>' 
" use <tab>/<S-tab> to navigate through popup menu  //NOT necessary. 
let g:xptemplate_pum_tab_nav = 1 
" xpt triggers only when you typed whole name of a snippet.   //NOT necessary. 
let g:xptemplate_minimal_prefix = 'full' 


" EasyGrep setting
let g:EasyGrepCommand=0
let g:EasyGrepRecursive = 1
let g:EasyGrepHidden = 0
let g:EasyGrepIgnoreCase= 1

" FuzzyFinder setting
let g:fuf_file_exclude='\v\~$|\.(o|exe|dll|bak|swp)$|(^|[/\\])\.(hg|git|bzr|svn|DS_Store)($|[/\\])'
let g:fuf_dir_exclude = '\v(^|[/\\])\.(hg|git|bzr|svn|DS_Store)($|[/\\])'
let g:fuf_previewHeight=0

nmap <leader>fb :FufBuffer<cr>
nmap <leader>ff	:FufFile<cr>
nmap <leader>fd	:FufDir<cr>
nmap <leader>ft	:FufTag<cr>
nmap <leader>fl	:FufLine<cr>


" NERDCommenter setting
let NERDShutUp=1
let g:NERDCommenterLeader="<leader>n" " change NERD_commenter.vim
let NERDSpaceDelims = 1

if MySys() == "mac"
    map <D-/> <Plug>NERDCommenterToggle
    imap <D-/> <C-O><Plug>NERDCommenterToggle
else
    map <M-/> <Plug>NERDCommenterToggle
    imap <M-/> <C-O><Plug>NERDCommenterToggle
endif

" jslint setting
let $JS_CMD='node'


" FuzzyFinder Plugin
" show symbols list with current file
let listener = {}

function listener.onComplete(item, method)
    let line_number = str2nr(matchstr(a:item, " \\d\\+ "))

    silent execute "normal " . line_number . "G"

    " Bring the line to the middle of the window
    normal! z.

    " If the line is inside a fold, open the fold
    if foldclosed('.') != -1
        .foldopen
    endif
endfunction

function listener.onAbort()
    return   
endfunction

nmap <leader>fg :call fuf#callbackitem#launch('', 0, '>Symbol>', listener, split(system('ctags -x --sort=yes "' . fnamemodify(bufname('%'), ':p') . '"'), "\n"), 0)<CR>
