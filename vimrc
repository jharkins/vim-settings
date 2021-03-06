" Joe's .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'jashkenas/coffee-script'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-vividchalk'
Plugin 'spf13/vim-colors'
Plugin 'pangloss/vim-javascript'

call vundle#end()


filetype plugin indent on     " required!
syntax on

" A bunch of my favorite settings
set hidden
set backspace=indent,eol,start
set nowrap			" don't wrap lines
set tabstop=4		" a tab is four spaces
set softtabstop=4   " a tab is four spaces
set shiftwidth=4
set textwidth=80
set copyindent		" copy the previous indentation on autoindenting
set autoindent		" automatically indent
set number			" always show line numbers
set shiftround		" use multiple of shiftwidth when " indenting with '<' and '>'
set showmatch		" set show matching parenthesis
set ignorecase		" ignore case when searching
set smarttab		" insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch		" highlight search terms
set incsearch		" incremental searching
set expandtab

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" Setup a column at 80 characters
set colorcolumn=80

" Automatically Compile Coffee Files
autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow

map <leader>t <C-p>

" Write files with sudo
cmap w!! w !sudo tee % >/dev/null

" Fun with gui settings
if has('gui_running')
	set background=dark
	colorscheme solarized
	set guioptions-=T           " remove the toolbar
	set lines=40                " 40 lines of text instead of 24,
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
		"set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 12,Consolas\ Regular\ 12,Courier\ New\ Regular\ 12
	else
		"set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h12,Consolas\ Regular:h12,Courier\ New\ Regular:h12
	endif
	if has('gui_macvim')
		set transparency=5          " Make the window slightly transparent
	endif
else
	colorscheme desert
	if &term == 'xterm' || &term == 'screen'
		set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
	endif
endif

" Fix the column color to not be so ugly
hi ColorColumn ctermfg=Grey ctermbg=Blue
hi ColorColumn guifg=Grey guibg=Blue

" javascript indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" sync syntax problems
autocmd FileType html map <C-l> :syntax sync fromstart<CR> <bar> :redraw!<CR>
autocmd FileType javascript map <C-l> :syntax sync fromstart<CR> <bar> :redraw!<CR>
