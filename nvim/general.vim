filetype plugin indent on							                                          "Enable plugins and indents by filetype
syntax enable                   						                                    "Turn on syntax highlighting
" syntax on                   						                                    "Turn on syntax highlighting
" if !exists("g:syntax_on")
"     syntax enable
" endif

" colorscheme ubaryd
" colorscheme janah
" colorscheme made_of_code
" colorscheme molokai
" colorscheme onehalfdark
" colorscheme angr
" colorscheme material-monokai

set cursorline      " Highlight current line
set colorcolumn=80  " highlight the 80 columns

set background=dark " Background color for better constrast

set termguicolors   " use true-colors in terminal
set title           " change the terminal's title

set clipboard=unnamed           						                                    "To enable copy paste in vim

" using different cursor size for insert mode and normal mode
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" sets the status line
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

"-------------------------- UI stuff ends here -----------------------

" }}}

" Common settings {{{

set encoding=utf-8
set showcmd                    " display incomplete commands


set splitright                 " opening buffer on the right
set splitbelow                 "Set up new horizontal splits positions
set nowrap                     " don't wrap lines

let mapleader = ","            " mapping leader(\) to ,

set wildmode=longest,list,full  						                                    "bash-like tab completion.
set wildmenu

" this is done to allow webpack to do auto complilation
" this setting will disable save write
set backupcopy=yes

" using all the colors 256 versions
let g:rehash256 = 1

set lazyredraw " redraw only when we need to.
set ttyfast    " Send more characters at a given time.

set ruler " Ruler on
set clipboard+=unnamed

set path+=**                                                                    "Allow recursive search

set history=500									                                                "show lots of cmd line history

set gcr=a:blinkon500-blinkwait500-blinkoff500 "set cursor blinking rate
" }}}

"  Tabs and Spaces {{{
" --------------------------------------------------------------------
"  TABS AND SPACES
" --------------------------------------------------------------------

set tabstop=2 shiftwidth=2     " a tab is two spaces (or set this to 4)
set expandtab                  " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode


" --------------------------------------------------------------------
"  Line numbers
" --------------------------------------------------------------------
"  Setting relative line number in normal mode and absolute in relative mode
set number relativenumber

" we are using auto cmd group because if the same autocmd has been
" defined twice in vimrc, vim will not replace the earlier one, it
" will keep both. So auto cmd groups will remove this possibility.
" The first command 'autocmd!' clears everything in the group.

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" --------------------- TABS AND SPACES ends here  ------------------
" }}}

" Indentation {{{
" --------------------------------------------------------------------
" INDENTATION
" --------------------------------------------------------------------
set cindent
set autoindent
set smarttab
set expandtab
set cpoptions+=$

" ------------------------ INDENTATION ENDS HERE --------------------
" }}}

" set spell spelllang=en_us       " enabling spelling check

set autoread                    " re-load files automatically

"" Visual
set showmatch

"" Ctags support
set tags=./tags;,tags;           " look for a tags file in the directory of the current file,
" then upward until / and in the working directory, then upward until /

" let g:easytags_dynamic_files = 1 " project specific ctags generation
" let g:easytags_async = 1         " Do not block vim do work in async

"" Support for ack
set grepprg=rg\ --vimgrep

" Searching {{{
" --------------------------------------------------------------------
"  SEARCHING
" --------------------------------------------------------------------

set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" ------------------------ SEARCHING ENDS HERE ----------------------
" }}}


set inccommand=split "Show substitute changes immidiately in separate split
set fillchars+=vert:\│ "Make vertical split separator full line


set linebreak                     "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·    "Set trails for tabs and spaces
set list                          "Enable listchars


set pumheight=30                "Maximum number of entries in autocomplete popup
set ttimeoutlen=0               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8          "Set utf-8 encoding on write


" ================ Scrolling ======================== {{{

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
" }}}

" ================ Abbreviations ==================== {{{

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev f find
cnoreabbrev F find

" }}}
