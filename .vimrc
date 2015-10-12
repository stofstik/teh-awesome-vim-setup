" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Place plugins here:
" Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim' " html plugin
" Plugin 'maksimr/vim-jsbeautify'
Plugin 'bronson/vim-trailing-whitespace' " to fix whitespace errors call :FixWhiteSpace
Plugin 'sickill/vim-pasta' " remaps p and P to context aware pasting for proper indentation
Plugin 'tpope/vim-surround'
Plugin 'lfilho/cosco.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required




" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
" if has("autocmd")
"   filetype plugin indent on
" endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" My own stuff:
:set number
:set relativenumber
:colorscheme darcula
:set tabstop=4
:set shiftwidth=4
:set t_Co=256
:iabbrev </ </<C-X><C-O>
:set omnifunc=syntaxcomplete#Complete

autocmd FileType javascript,css nnoremap <silent> <leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Disable arrow keys in normal mode
nnoremap <Up>	<Nop>
nnoremap <Down>	<Nop>
nnoremap <Left>	<Nop>
nnoremap <Right>	<Nop>
" Disable arrow keys in insert mode
inoremap <Up>	<Nop>
inoremap <Down>	<Nop>
inoremap <Left>	<Nop>
inoremap <Right>	<Nop>

" Syntastic stuff
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Don't forget to install jshint or some other checker like this:
" sudo npm install -g jshint
" sudo echo "PATH=\$PATH:/usr/local/lib/node_modules/jshint" >> ~/.profile

" Airline stuff:
set laststatus=2
