"--------------------
" Use Vundle to manage bundles
"--------------------
set nocompatible  " be iMproved
set helplang=cn  " point the language of help
set encoding=utf-8  
set fileencoding=utf-8  
set fileencodings=utf-8,gbk,latin1 "

set termencoding=chinese  
language message zh_CN.UTF-8

filetype off    " required!
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/vimfiles/bundle/'
call vundle#begin(path)

Bundle 'gmarik/Vundle.vim'
source $VIM/vimfiles/vimrc.vundle

call vundle#end()

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
set backupdir=$VIM/vimfiles/bak  " where to put backup file
set dir=$VIM/vimfiles/tmp  " tell vim where to put swap files
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
set t_Co=256
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

" --- NERDTree
"nnoremap <silent> <F3> :NERDTreeToggle<CR>
"nnoremap <leader>n :NERDTreeToggle<CR>
" Close vim if the only window left open is the NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree
map <F10> :NERDTreeToggle<CR>
let NERDSpaceDelims=1       " ��ע�ͷ������֮����һ���ո�
let NERDCompactSexyComs=1   " ����ע��ʱ���Ӹ��ÿ�
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
"let g:miniBufExplorerMoreThanOne=1         "�Զ���  

" winmanager   
let g:winManagerWindowLayout='NERDTree'  
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'  
"let g:winManagerWindowLayout = 'FileExplorer|TagList'  
"let g:winManagerWindowLayout = 'FileExplorer'  
let g:winManagerWidth = 35  
let g:defaultExplorer = 0  
let g:AutoOpenWinManager = 1
"nmap wm :WMToggle<cr>:q<cr>  
nmap <silent> wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>
"nmap <C-W><C-F> :FirstExplorerWindow<cr>  
"nmap <C-W><C-B> :BottomExplorerWindow<cr>  
"autocmd BufWinEnter \[Buf\ List\] setl nonumber 
