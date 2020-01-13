" set t_Co=256                  "enable 256 colors

if exists('g:vscode')
  set clipboard=unnamed           						                                    "To enable copy paste in vim
  let mapleader = ","            " mapping leader(\) to ,
  nnoremap <leader><space> :noh <CR>
  inoremap <leader>w <Esc>:w<CR>
  nnoremap <leader>w :w<CR>
  vnoremap <leader>w <Esc>:w<CR>gv
else
  source ~/.config/nvim/general.vim "contains important setting for everything to work

  set hidden

  "install vim-plug if not installed already
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent execute "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall | source '~/.config/nvim/init.vim'
  endif

  call plug#begin('~/.config/nvim/plugged')

  """" Base Plugins -----------------------------------
  Plug 'neoclide/coc.nvim', {'branch': 'release'}    " another code completion library with language server protocol support
  Plug 'honza/vim-snippets'
  Plug 'tomtom/tcomment_vim'                         " source for gcc command for comments
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'                           "needed by fugitive to browse the file on github/remote
  Plug 'mtth/scratch.vim'                            " put anything in scratch buffer, no need to create any file
  Plug 'mattn/emmet-vim'                             " emmet support for vim
  Plug 'SirVer/ultisnips'                            " snippet pluggin
  Plug 'tpope/vim-surround'                          " change or delete surrounding text
  Plug 'flazz/vim-colorschemes'
  Plug 'yggdroot/indentline'
  Plug 'Raimondi/delimitMate'                        " Provides automatic closing quotes, parens
  Plug 'tpope/vim-endwise'                           " Adds end to ruby code
  Plug 'airblade/vim-gitgutter'                      " Git gutter support for vim
  Plug 'vim-scripts/BufOnly.vim'                     " delete all buffers but current one
  Plug 'rainerborene/vim-reek'                       " Reek code smell checker
  Plug 'tpope/vim-obsession'                         " vim session management
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neomake/neomake', { 'do': 'npm install eslint; gem install rubocop'} " asynchronous linting in neovim

  " On-demand loading
  Plug 'scrooloose/nerdtree'
  " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'               "Always load this in last


  """" Ruby Plugins --------------------------------------
  " Plug 'tpope/vim-rails', { 'for': 'ruby' }          " was not working, enable it sometimes later
  " Plug 'vim-ruby/vim-ruby'                           " Vim/ Ruby configuration files for ruby
  " Plug 'kana/vim-textobj-user'                       " requires for custom text object
  " Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby'}  " ruby code Completion
  " Plug 'Shougo/deoplete-rct', { 'for' : 'ruby'}      " ruby code completion using rcodetools gem
  " Plug 'tpope/vim-rbenv'                             " Rbenv support for vim
  " Plug 'tpope/vim-bundler'                           " Bundler support for vim
  " Plug 'nelstrom/vim-textobj-rubyblock'              " text object facility for ruby blocks
  " Plug 'tpope/vim-dispatch'                          " asynchronous calls from vim rails
  " Plug 'thoughtbot/vim-rspec'                        " Run rspec from vim
  " Plug 'zchee/deoplete-jedi'                         " completion for python
  " Plug 'ngmy/vim-rubocop'                            " RoboCop syntax checker
  " Plug 'thoughtbot/vim-rspec'
  " Plug 'tpope/vim-haml'                              " Latest HAML support


  """"" JavaScript -----------------------
  " Plug 'othree/javascript-libraries-syntax.vim'      " library syntax for vim
  " Plug 'othree/yajs.vim'                             " syntax library for javascript
  " Plug 'othree/es.next.syntax.vim'                   " for es next features, required by yajs
  Plug 'mxw/vim-jsx'                                 " jxs support in neovim
  Plug 'pangloss/vim-javascript'
  " Plug 'jelera/vim-javascript-syntax'                " Enhanced javascript syntax support for vim
  " Plug 'styled-components/vim-styled-components'     " support for styled components react in vim
  " Plug 'alvan/vim-closetag'                          " Auto close tag for jsx components

  Plug 'hail2u/vim-css3-syntax'                      " css3 support for vim

  " Plug 'sheerun/vim-polyglot'                        " A collection of language pack for vim for syntax highlighting, indentation etc
  " Plug 'rakr/vim-one'                                " Theme for vim
  " Plug 'yegappan/greplace'

  Plug 'tpope/vim-abolish'

  " Plug 'octol/vim-cpp-enhanced-highlight'            " cpp highlighting
  " Plug 'pseewald/vim-anyfold'

  " Plug 'skywind3000/asyncrun.vim'                    " run system commands asynchronously

  Plug 'chrisbra/csv.vim'
  Plug 'avakhov/vim-yaml'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'kristijanhusak/vim-hybrid-material'
  " Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

  "Automatic creation of ctags upon opening of a project
  " Plug 'ludovicchabant/vim-gutentags'

  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

  Plug 'ntpeters/vim-better-whitespace'              " remove whitespace; not good as it is bit slow, moving to a git commit hook

  " }}}
  "
  " Plug 'gabrielelana/vim-markdown'
  " Plug 'bronson/vim-visual-star-search'
  " Plug 'moll/vim-node'


  """ Colorschemes for vim
  " Plug 'joshdick/onedark.vim'                        " One dark theme for vim
  " Plug 'drewtempelmeyer/palenight.vim'               " Colorscheme for vim
  " Plug 'ayu-theme/ayu-vim'
  " Plug 'morhetz/gruvbox'
  " Plug 'altercation/vim-colors-solarized'
  " Plug 'wesgibbs/vim-irblack'
  " Plug 'dracula/vim', { 'as': 'dracula' }

  call plug#end()

  " let g:hybrid_custom_term_colors = 1
  " let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

  " let g:enable_bold_font = 1      						                                    "Enable bold font in colorscheme
  " let g:enable_italic_font = 1    						                                    "Enable italic font in colorscheme


  source ~/.config/nvim/rails_projections.vim
  source ~/.config/nvim/plugins.vim " Settings for the plugins
  source ~/.config/nvim/keys.vim " Settings for custom key mapping
  source ~/.config/nvim/custom_commands.vim

  set background=light
  " project wise vimrc file
  set exrc
endif
