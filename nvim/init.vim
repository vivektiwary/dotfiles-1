" set t_Co=256                  "enable 256 colors
source ~/.config/nvim/general.vim "contains important setting for everything to work

set hidden

"install vim-plug if not installed already
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source '~/.config/nvim/init.vim'
endif

call plug#begin('~/.config/nvim/plugged')


Plug 'tpope/vim-rails', { 'for': 'ruby' }          " was not working, enable it sometimes later
Plug 'kana/vim-textobj-user'                       " requires for custom text object
Plug 'vim-ruby/vim-ruby'                           " Vim/ Ruby configuration files for ruby
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " another code completion library with language server protocol support
" Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby'}  " ruby code Completion
Plug 'Shougo/deoplete-rct', { 'for' : 'ruby'}      " ruby code completion using rcodetools gem
Plug 'tpope/vim-rbenv'                             " Rbenv support for vim
Plug 'tpope/vim-bundler'                           " Bundler support for vim
Plug 'nelstrom/vim-textobj-rubyblock'              " text object facility for ruby blocks
Plug 'tpope/vim-dispatch'                          " asynchronous calls from vim rails
Plug 'thoughtbot/vim-rspec'                        " Run rspec from vim

Plug 'Shougo/denite.nvim'                          " Dark powered alternative for unite vim to unite all interfaces

Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'                         " source for gcc command for comments
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                                                        "needed by fugitive to browse the file on github/remote

Plug 'zchee/deoplete-jedi'                         " completion for python
Plug 'Shougo/neco-vim'                             " vim code Completion
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " Javascript autocompletion

Plug 'mtth/scratch.vim'                            " put anything in scratch buffer, no need to create any file
Plug 'mattn/emmet-vim'                             " emmet support for vim
Plug 'SirVer/ultisnips'                            " snippet pluggin
Plug 'tpope/vim-surround'                          " change or delete surrounding text
Plug 'flazz/vim-colorschemes'
Plug 'yggdroot/indentline'
Plug 'Raimondi/delimitMate'                        " Provides automatic closing quotes, parens
Plug 'tpope/vim-endwise'                           " Adds end to ruby code
Plug 'airblade/vim-gitgutter'                      " Git gutter support for vim
Plug 'euclio/vim-markdown-composer', { 'for': 'markdown' }                " Better than vim-markdown-preview
Plug 'vim-scripts/Rename'                          " Rename a file in buffer and on disk
Plug 'vim-scripts/BufOnly.vim'                     " delete all buffers but current one
Plug 'pbrisbin/vim-mkdir'                          " Automatic creating non-existant directories
Plug 'ngmy/vim-rubocop'                            " RoboCop syntax checker
Plug 'rainerborene/vim-reek'                       " Reek code smell checker
Plug 'tpope/vim-haml'                              " Latest HAML support
Plug 'tpope/vim-obsession'                         " vim session management
Plug 'octol/vim-cpp-enhanced-highlight'            " cpp highlighting
Plug 'pseewald/vim-anyfold'

Plug 'skywind3000/asyncrun.vim'                    " run system commands asynchronously
Plug 'othree/javascript-libraries-syntax.vim'      " library syntax for vim

" Plug 'othree/yajs.vim'                             " syntax library for javascript
" Plug 'othree/es.next.syntax.vim'                   " for es next features, required by yajs
Plug 'mxw/vim-jsx'                                 " jxs support in neovim
Plug 'pangloss/vim-javascript'

" Plug 'jelera/vim-javascript-syntax'                " Enhanced javascript syntax support for vim
Plug 'styled-components/vim-styled-components'     " support for styled components react in vim
Plug 'hail2u/vim-css3-syntax'                      " css3 support for vim
Plug 'alvan/vim-closetag'                          " Auto close tag for jsx components

Plug 'sheerun/vim-polyglot'                        " A collection of language pack for vim for syntax highlighting, indentation etc
Plug 'rakr/vim-one'                                " Theme for vim
Plug 'yegappan/greplace'

Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'avakhov/vim-yaml'
Plug 'terryma/vim-smooth-scroll'
Plug 'neomake/neomake', { 'do': 'npm install eslint; gem install rubocop'} " asynchronous linting in neovim
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'thoughtbot/vim-rspec'

"Automatic creation of ctags upon opening of a project
Plug 'ludovicchabant/vim-gutentags'

" Changes for javascript

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'vim-scripts/AnsiEsc.vim'

Plug 'ntpeters/vim-better-whitespace'              " remove whitespace; not good as it is bit slow, moving to a git commit hook
" }}}
"
" Plug 'gabrielelana/vim-markdown'
" Plug 'bronson/vim-visual-star-search'
" Plug 'moll/vim-node'

" On-demand loading
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'               "Always load this in last

""" Plugins for Java Development
Plug 'artur-shaik/vim-javacomplete2'               " Completion for java
Plug 'sbdchd/neoformat'                            " Code formatter for NeoVim
Plug 'vim-jp/vim-java'                             " Syntax highlighting fix for java
Plug 'vim-scripts/cSyntaxAfter'                    " better highlight for c-family languages

""" Colorschemes for vim
Plug 'joshdick/onedark.vim'                        " One dark theme for vim
Plug 'drewtempelmeyer/palenight.vim'               " Colorscheme for vim
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'wesgibbs/vim-irblack'
Plug 'dracula/vim', { 'as': 'dracula' }

" Plug 'https://github.com/vim-scripts/ScrollColors'
" Plug 'myjoytou/YouCompleteMe'                      " Using forked version of
" YCM as it was causing the backspace in delimitmate to break and both quotes
" were not getting deleted correctly, when using :DelimitMateText, it got
" caught
" Plug 'Valloric/YouCompleteMe'                      " Completion engine for vim
" Plug 'osyo-manga/vim-monster'                      " ruby code completion
" Plug 'vim-syntastic/syntastic'                     " syntax linting support for vim
" Plug 'w0rp/ale'                                    " Seems better than neomake
" Plug 'dyng/ctrlsf.vim'                             " Search every where ctrl shift f functionality like sublime
" Plug 'terryma/vim-multiple-cursors'                " press ctrl n for selecting multiple similar words at a time
" Plug 'epilande/vim-react-snippets'
" Plug 'epilande/vim-es2015-snippets'
" Plug 'ternjs/tern_for_vim'                         " completion engine for javascript
" Plug 'vim-scripts/taglist.vim'                     " Source code browser
" Plug 'JamshedVesuna/vim-markdown-preview'          " Previewing markdown without leaving vim
" Plug 'jceb/vim-orgmode'                            " Todo list in vim like emacs org mode
" Plug 'tpope/vim-speeddating'                       " dependency for vim-orgmode
" Plug 'godlygeek/tabular'                           " plugin to auto align things
" Plug 'easymotion/vim-easymotion'                   " easy motion for vim, which removes <number> out of <number>w and uses <leader><leader> to trigger


" Plug 'Quramy/vim-js-pretty-template'               " template string syntax support for javascript
" Plug 'tpope/vim-abolish'                           " easily search for, substitute, and abbreviate multiple variants of a word
" Plug 'wikitopian/hardmode'                         " disable h,j,k,l and arrow keys in vim
" Plug 'skwp/greplace.vim'                           " Search and replace across all files interactively
" Plug 'chrisbra/csv.vim'                            " CSV support for VIM
" Plug 'vim-scripts/IndexedSearch'                   " shows 'Nth match out of M' at every search (index of match+total # matches)
" Plug 'vim-scripts/Specky'                          " Functions to help make behavioral testing easy with ruby and rspec, it was too old
" Plug 'garbas/vim-snipmate'                         " Not very good as ultisnip will replace it
" Plug 'MarcWeber/vim-addon-mw-utils'                " Required by snipmate
" Plug 'tomtom/tlib_vim'                             " Required by snipmate. This library provides some utility functions. There isn't much need to  install it unless another plugin requires you to do so. NOT SO IMPORTANT
" Plug 'majutsushi/tagbar'      " Display tags in a window ordered by scope,
" there was some problem with this plugin
" Plug 'xolox/vim-easytags'     " Automatic generation of ctags
" Plug 'xolox/vim-misc'                              " Required by vim easytags
" Plug 'alvan/vim-closetag'   " Auto close html tags. No use!!!
" Plug 'thaerkh/vim-workspace'   " Auto save files and Sessions
" Plug 'vim-scripts/SyntaxComplete'
" Plug 'tpope/vim-dispatch'      " Plug for async call using vim
" Plug 'vim-scripts/ShowMarks'   " Plug for showing marks set by m
" Plug 'vim-scripts/project.tar.gz' " not required
" Plug 'vim-scripts/DfrankUtil'
" Plug 'vim-scripts/vimprj'
" Plug 'vim-scripts/indexer.tar.gz'
" Plug 'justinmk/vim-syntax-extra'

call plug#end()

" color janah
" colorscheme hybrid_material
" color molokai
" color vividchalk
" set background=dark                                                             "Set background to dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

let g:enable_bold_font = 1      						                                    "Enable bold font in colorscheme
let g:enable_italic_font = 1    						                                    "Enable italic font in colorscheme


source ~/.config/nvim/rails_projections.vim
source ~/.config/nvim/plugins.vim " Settings for the plugins
source ~/.config/nvim/keys.vim " Settings for custom key mapping
source ~/.config/nvim/custom_commands.vim

set background=light
" project wise vimrc file
set exrc
