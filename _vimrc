
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Hai li
" Mail :  lihaicg@126.com
" Reference : http://amix.dk/vim/vimrc.html
" File link : https://github.com/haicg/vimrc
" Sections:
"    -> Get Platform
" 	 -> Auto update file .vimrc
"    -> General
"    -> VIM user interface
"    -> python IDE configure
"    -> C/CPP IDE configure
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Develop tool for Programer
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Get Platform
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Distinguish the system platform
function! MySys()
	if has("win32")
		return "windows"
	else
		return "linux"
endfunction

let s:SystemString=MySys()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto update file .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","  "定义  <leader> = ,
"Fast reloading the vimrc
"define shortcut key “,ss” to open the vimrc
if s:SystemString=="windows"
	"Fast reloading the vimrc
	map <silent> <leader>ss :e $HOME/_vimrc <cr>
	"Auto reload vimrc
	"autocmd! bufwritepost _vimrc source $HOME/_vimrc <cr>
else
	map <silent> <leader>ss :e $HOME/.vimrc <cr>
	"Auto reload vimrc
	"autocmd! bufwritepost .vimrc source $HOME/.vimrc
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

"启用鼠标
if has("mouse")
	set mouse=a
endif

"close the vi mode
set nocp
set backspace=indent,eol,start

" Enable filetype plugins
filetype on  "open the filetype detection
filetype plugin on
filetype indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread
"set line number
set nu
" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hid
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""
"python IDE configure
""""""""""""""""""""""""""""""""
function Configure4python()
	"set tabstop=4
	"set softtabstop=4
	"set shiftwidth=4
	"set expandtab
"	set makeprg=python\ %<

    set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    nmap <F5> :!python %
    nmap <F6> :make
"pydiction 1.2 python auto complete
    let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
    "defalut g:pydiction_menu_height == 15
    "let g:pydiction_menu_height = 20
    "copen "如果是py文件，则同时打开编译信息窗口
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endfunction

func InitPythonConfig()
		call Configure4python()
		call setline((line('$')),"\#coding=utf-8")
		call append((line('$')),"\###File Name:".expand("%"))
		call append(line("$"), "\###Author:haicg")
		call append(line("$"), "\###Mail:lihaicg@126.com")
		call append(line("$"), "\###Created Time: ".strftime("%c"))
		call append(line("$"),"\###File Name : ".expand("%"))
		call append(line("$"),"\#!/usr/bin/env python")
		call append(line("$"), "")
endfunc

"""""""""""""""""""""""""""""""""
"C/CPP IDE configure
""""""""""""""""""""""""""""""""

""
""/*****************************************
""** File:   proj1.c
"** Author: Bob Smith
"** Date:   6/22/99
"** Section:304
"** E-mail: bsmith22@gl.umbc.edu
"**
"**   This file contains the main driver program for project 1.
"** This program reads the file specified as the first command line
"** argument, counts the number of words, spaces, and characters and
"** displays the results in the format specified in the project description
"**
"** Other files required are
"**      1. chars.c -- routines that count each type of character
"**      2. words.c -- routines that count each word
"**      3. proj1.h -- prototypes for all functions needed by this file
"**
"***********************************************/
""


function! InitCstyleCodeFile()
		call setline((line('$')),"/**********************************************************************")
		call append (line("$"),  "** \\file ".expand("%"))
		call append (line("$"),  "** \\brief    ")
		call append(line("$"),   "** \\author lihaicg")
		call append(line("$"),   "** \\date ".strftime("%c"))
		call append(line("$"),   "** Mail:  lihaicg@126.com" )
		call append(line("$"), "************************************************************************/")
		call append(line("$"), "")
endfunction


function! InitCppConfig()
	call InitCstyleCodeFile()
	call append(line("$"), "#include <iostream>")
	call append(line("$"), "using namespace std;")
	call append(line("$"), "")
endfunction

function! InitCConfig()
	call InitCstyleCodeFile()
	call append(line("$"), "#include <stdio.h>")
	call append(line("$"), "")
endfunction




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts(solve the Chinese garbage problem)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
if s:SystemString == "windows"
    set fileencoding=chinese
    set termencoding=chinese
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	set fileencodings=chinese,utf-8,gbk,cp936
else
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,chinese,gbk,cp936
    set guifont=Courier\ New\ 12
endif

language messages zh_CN.utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :nohl<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,sp will toggle and untoggle spell checking
map <leader>sp :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""
"==> Developer Tool for Programer
"==> Ctags && Tag_list
"""""""""""""""""""""""

if s:SystemString == "windows"                "设定windows系统中ctags程式的位置
     let Tlist_Ctags_Cmd = "ctags"
else
     let Tlist_Ctags_Cmd = "/usr/bin/ctags"
    set tags+=$HOME/.vim/tags/cppTags
    set tags+=$HOME/.vim/tags/dbusTags
endif
nmap <leader>tgc :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>
			\:set tags+=tags
nmap <leader>tg :!ctags -R *<cr>
set tags+=tags;
set autochdir

let Tlist_Show_One_File =1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

"->BufExplorer
"let g:bufExplorerDefaultHelp=0
"let g:bufExplorerShowRelativePath=1
"let g:bufExplorerSortBy='mru'
"let g:bufExplorerSplitRight=0
"let g:bufExplorerSplitVertical=1
"let g:bufExplorerSplitVertSize = 30
"let g:bufExplorerUseCurrentWindow=1
"autocmd BufWinEnter \[Buf\ List\] setl

"->miniBufExplorer

  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapCTabSwitchBufs = 1
  let g:miniBufExplModSelTarget = 1

"->winManager setting
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"nmap <C-W><C-F> :FirstExplorerWindow<cr>
"nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <leader>wm :WMToggle<cr>


"->My configure the vim IDE according to the filetype
autocmd BufNewFile  *.py call InitPythonConfig()
autocmd BufNewFile *.c call InitCConfig()
autocmd BufNewFile *.cpp call InitCppConfig()
autocmd BufRead *.py call Configure4python()


"->Configure the compilation key and function
function DoOneFileMake()
	if(expand("%:p:h")!=getcwd())
		echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press redirect to the dir of this file."
	endif

	exec "w"
	call SetCompilation()
	exec "make"
	exec "copen"
endfunction

function! SetCompilation()
	if &filetype=='c'
		set makeprg=gcc\ %\ -o\ %<
	elseif &filetype=='cpp'
		set makeprg=g++\ %\ -o\ %<
	endif
endfunction

"->auto complete
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 "display the function parameter list
let OmniCpp_MayCompleteDot = 1	"autocompletion after dot input
let OmniCpp_MayCompleteArrow = 1 "autocompletion after arrow input
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"python code complete

"if s:SystemString == "windows"
"    let g:pydiction_location = $VIMRUNTIME.'\plugin\complete-dict'
"else
"    let g:pydiction_location = $VIMRUNTIME.'/plugin/complete-dict'
"endif
"let g:pydiction_menu_height = 20 ”设置弹出菜单的高度，默认是15

""config the cscope
function! CreateCscopeOut()
	:!find . -regex '.*\.c\|.*\.cpp\|.*\.h\|.*\.hpp\|.*\.py' > cscope.files *<CR>
	:!cscope -b -i cscope.files -f cscope.out <CR>
	:cs kill -l<CR>
    :cs add cscope.out
endfunction

if s:SystemString=='windows'
    "echo "hello windows"
else
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    if has("cscope")
        nmap <F12> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
    \:!cscope -b -i cscope.files -f cscope.out<CR>
    \:cs kill -l<CR>
    \:cs add cscope.out
        set csprg=/usr/bin/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
"       if filereadable("cscope.out")
 "      cs add cscope.out
  "     " else add database pointed to by environment
   "    elseif $CSCOPE_DB != ""
    "   cs add $CSCOPE_DB
     "  endif
        set csverb
        "nmap <F12> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' -iname '*.py' > cscope.files<CR>
		"
	"nmap <leader>cc :!find . -regex '.*\.c\|.*\.cpp\|.*\.h\|.*\.hpp\|.*\.py' > cscope.files
	"nmap <leader>oo :! cscope -b -i cscope.files -f cscope.out
    endif
endif

""""""""""""""""""""""""""""""""""""
"==> map the commond
"""""""""""""""""""""""
""base operation
nmap <F4> :call DoOneFileMake()<CR>
nmap <C-a> ggVG$
vmap <C-c> "+y
nmap <C-v> "+p

"nmap <F12> :helptags $VIMRUNTIME/doc<CR>
nmap <leader>ll :TlistToggle<CR>



"""""""""""""""""""""""""""""""""
"something wrong
"nmap wv <C-w>v "垂直分割
"nmap wc <C-w>c "close the current windows
"nmap ws <C-w>s "水平分割当前窗口
"nmap ws <C-w>s "水平分割当前窗口
"nmap ws <C-w>s "水平分割当前窗口

"Autocmd to do something while closing the file
autocmd BufWritePre * sil %s/\s\+$//ge "remove the whitespace at the line end
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

"filetype off "required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set nowrap
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
"My repos on github
Bundle 'haicg/vimscript'
" original repos on github
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
"ndle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'python-imports.vim'
Bundle 'CaptureClipboard'
filetype plugin indent on     " required!
