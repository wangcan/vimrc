"--------------------
" Use Vundle to manage bundles
"--------------------
set nocompatible	" be iMproved
filetype off		" required!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
source ~/.vim/vimrc.vundle 

"--------------------
" General Settings
"--------------------
set bs=indent,eol,start	" allow backspacing over everything in insert mode
set history=100		" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set ar				" auto read when file is changed from outside
set nu				" show line numbers

filetype on			" Enable filetype detection
filetype indent on	" Enable filetype-specific indenting
filetype plugin on	" Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on			" syntax highlight
set hlsearch		" search highlighting

" terminal color settings
if has("gui_running")	" GUI color and font settings
	set guifont=Courier:h18
	set background=dark 
	set t_Co=256		" 256 color mode
	set cursorline	" highlight current line
	highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
	colors moria
else
	colors evening
endif
