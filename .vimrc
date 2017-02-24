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

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Git diff in line number column
Plugin 'airblade/vim-gitgutter'

" Syntax checker
" Plugin 'scrooloose/syntastic'
" Plugin 'mtscout6/syntastic-local-eslint.vim'

" Using neomake na0
Plugin 'neomake/neomake'
Plugin 'benjie/neomake-local-eslint.vim'

" Emmet for vim
Plugin 'mattn/emmet-vim'

Plugin 'editorconfig/editorconfig-vim'

" Beautify js, json, html, css, etc
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify' " Used by vim-jsbeautify
" Jade beautifier and 2 space indentation
Plugin 'digitaltoad/vim-jade'
Plugin 'joukevandermaas/vim-ember-hbs'

" to fix whitespace errors call :FixWhiteSpace
Plugin 'bronson/vim-trailing-whitespace'

" Awesome surroundness
Plugin 'tpope/vim-surround'
" Git wrapper for vim : )
Plugin 'tpope/vim-fugitive'
" Enable dot (.) for plugin shorthands
Plugin 'tpope/vim-repeat'

" Easy semicolon appending with '\ ;' whereever on a line
Plugin 'lfilho/cosco.vim'

" Auto close brackets, quotes, etc.
Plugin 'jiangmiao/auto-pairs'

" Auto close html, xml, etc.
" Plugin 'alvan/vim-closetag'

" Info line at the bottom of the screen
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" tmux statusline integration
Plugin 'edkolev/tmuxline.vim'

" Fuzzy finder (quick file finder) press 'ctrl-p'! :)
Plugin 'ctrlpvim/ctrlp.vim'

" Markdown preview
Plugin 'JamshedVesuna/vim-markdown-preview'

" Auto completer:
" Dont forget to compile using 'cd ~/teh-awesome-vim-setup/YouCompleteMe/ &&
" install.py --tern-completer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

" Improved javascript syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'crusoexia/vim-javascript-lib'

" Coffee script support
Plugin 'kchmck/vim-coffee-script'

" Typescript Syntax for Vim
Plugin 'leafgarland/typescript-vim'

" Navigate vim & tmux panes with hjkl
Plugin 'christoomey/vim-tmux-navigator'

" Sublime style minimap
Plugin 'severin-lemaignan/vim-minimap'

" HARD MODE
Plugin 'wikitopian/hardmode'

" Highlight color codes
Plugin 'ap/vim-css-color'

" base 16 colorschemes : )
Plugin 'chriskempson/base16-vim'
" ALL THE COLORS
Plugin 'flazz/vim-colorschemes'
" Oh hai monokai
Plugin 'crusoexia/vim-monokai'
" So surprised solarized!
Plugin 'altercation/vim-colors-solarized'
" Crosshairs w00t
Plugin 'bronson/vim-crosshairs'

" Indentation based on what current file uses
Plugin 'tpope/vim-sleuth'

" CSS syntax support
Plugin 'hail2u/vim-css3-syntax.git'

" All teh snippets!
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'vim-ruby/vim-ruby'

Plugin 'dkprice/vim-easygrep'

Plugin 'wakatime/vim-wakatime'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
" set showmatch	" Show matching brackets.
set noignorecase	" Do case sensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" My own stuff:
set number
set relativenumber
syntax on
syntax enable
set tabstop=2
set shiftwidth=2
set noexpandtab
iabbrev </ </<C-X><C-O>
set omnifunc=syntaxcomplete#Complete
set colorcolumn=80
set pastetoggle=<F2>
set clipboard=unnamed
set timeoutlen=1000 ttimeoutlen=0
" Enable cursor crosshair
set cursorline
set cursorcolumn
let w:persistent_cursorline = 1
" Easily switch buffers
nnoremap <c-b> :bprevious <Enter>
nnoremap <c-n> :bnext <Enter>
nnoremap <F10> :bd <Enter>
" Easily save
nnoremap <F5> :w <Enter>

nnoremap <F4>  :NERDTreeToggle <Enter>

set t_Co=256
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let base16colorspace=256
let g:solarized_termcolors=256
let g:NERDTreeWinSize = 24
colorscheme monokai

" Ctrl-A is used for tmux, but we want vim's inc dec functionality
nnoremap <c-c> <c-a>

" Awesome esc remap!
inoremap jj <Esc>
inoremap kk <Esc>

" if filereadable(expand("~/.vimrc_background"))
  " source ~/.vimrc_background
" endif

" Save all temp madness to one dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Easily toggle background color
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Mouse fix for tmux and vim
set mouse+=a
if &term =~ '^screen'
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

autocmd FileType jade setlocal tabstop=2 shiftwidth=2 expandtab smarttab

" Use leader ; to place a semicolon at the end of the line
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
inoremap <Right>    <Nop>

" " Syntastic stuff
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_balloons = 1
" " let g:syntastic_debug = 3
" let g:syntastic_javascript_checkers = ['eslint']

" Neomake stuff
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_json5_enabled_makers = ['jsonlint']
let g:neomake_coffee_enabled_makers = ['coffeelint']
autocmd! BufWritePost * Neomake

" Airline stuff:
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'crosshair'
let g:tmuxline_theme = 'zenburn'

" Nerd commenter stuff
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" Ctrl-p
" Ignore certain stuff
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules$|build$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" Use most recent files first
let g:ctrlp_cmd = 'CtrlPMixed'

" Fix editorconfig + fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" JsBeautify stuff
" Bind Ctrl-F to beautify whole file in any mode
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType typescript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" Bind Ctrl-F to beautify selection in visual mode
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType typescript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" Use jsx in js files as well
let g:jsx_ext_required = 0

" Mustache auto completion
let g:mustache_abbreviations = 1

" Auto close tags for these filetypes
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" vim-javascript stuff
let g:javascript_enable_domhtmlcss = 1
" set foldmethod=syntax " Please note this can have a dramatic effect on performance and because it is a global vim option, we do not set it ourselves.

" We already use ctrl-p
let vim_markdown_preview_hotkey='<C-m>'
" Use github markdown
let vim_markdown_preview_github=1

" Mappings to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

