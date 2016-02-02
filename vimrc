"--------------------
" Base settings
"--------------------
set nocompatible  " be iMproved
set helplang=cn  " point the language of help
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,latin1 "

set termencoding=chinese  
language message zh_CN.UTF-8

"--------------------
" Use Vundle to manage bundles
"--------------------
filetype off    " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
"set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
"let path='$VIM/vimfiles/bundle/'
"call vundle#begin(path)

Bundle 'gmarik/Vundle.vim'
"source $VIM/vimfiles/vimrc.vundle
source ~/.vim/vimrc.vundle 

"call vundle#end()

"--------------------
" General Settings
"--------------------
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set history=100    " keep 100 lines of command line history
set ruler      " show the cursor position all the time
set autoread        " auto read when file is changed from outside
set nu        " show line numbers

filetype on      " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on      " syntax highlight
set hlsearch    " search highlighting

" terminal color settings
if has("gui_running")  " GUI color and font settings
  set guifont=Courier:h18
  set background=dark 
  set t_Co=256    " 256 color mode
  set cursorline  " highlight current line
  highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
  colors moria
else
  colors evening
endif

set clipboard=unnamed  " yank to the system register (*) by default
set showmatch    " Cursor shows matching ) and }
set showmode    " Show current mode
set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu    " wild char completion menu

" ignore these files while expanding wild chars
set wildignore+=.svn,CVS,.git 
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg 

set autoindent    " auto indentation
set incsearch    " incremental search
set backup      " save backup files
"set backupdir=$VIM/vimfiles/bak  " where to put backup file
"set dir=$VIM/vimfiles/tmp  " tell vim where to put swap files
set backupdir=~/.vim/bak  " where to put backup file
set dir=~/.vim/tmp  " tell vim where to put swap files
set copyindent    " copy the previous indentation on autoindenting
set ignorecase    " ignore case when searching
set smartcase    " ignore case if search pattern is all lowercase,case-sensitive otherwise
set nosmarttab    " insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells visualbell t_vb=
set tm=500

" TAB setting
set noexpandtab    "DO-NOT replace <TAB> with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType yaml set expandtab

" FOLDING
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

" status line
"set laststatus=2
"set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
"set statusline+=\ \ \ [%{&ff}/%Y] 
"set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
"set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
" vim-powerline
set laststatus=2
"set t_Co=256
let g:Powerline_symbols='unicode'

fun! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "") 
  return curdir
endfun

fun! HasPaste()
  if &paste
    return '[PASTE]'
  else
    return ''
  endif
endfun

" taglist   
let Tlist_Ctags_Cmd = 'c:/Vim/vimfiles/bin/ctags.exe' " 指定ctags程序的位置  
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compart_Format = 1        " 压缩方式  
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树 (鼠标可以点开)  
let Tlist_Exit_OnlyWindow = 1      " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 0      " 在左侧显示窗口  
let Tlist_WinWidth = 40
let Tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
nmap <silent> <leader>tl :Tlist<cr>  

" --- NERDTree
"nnoremap <silent> <F3> :NERDTreeToggle<CR>
"nnoremap <leader>n :NERDTreeToggle<CR>
" Close vim if the only window left open is the NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree
map <F10> :NERDTreeToggle<CR>
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
let g:NERDTree_title = "NERDTree"
function! NERDTree_Start()
  exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
  return 1
endfunction
 
" minibufexpl  
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1   
let g:miniBufExplorerMoreThanOne=1         "自动打开  

" winmanager   
let g:winManagerWindowLayout='NERDTree'  
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'  
"let g:winManagerWindowLayout = 'FileExplorer|TagList'  
"let g:winManagerWindowLayout = 'FileExplorer'  
let g:winManagerWidth = 30
let g:defaultExplorer = 0  
let g:AutoOpenWinManager = 1
"nmap wm :WMToggle<cr>:q<cr>  
nmap <silent> wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>
"nmap <C-W><C-F> :FirstExplorerWindow<cr>  
"nmap <C-W><C-B> :BottomExplorerWindow<cr>  
"autocmd BufWinEnter \[Buf\ List\] setl nonumber 

