"" Nerd Tree specific {{{
augroup nerdtree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  noremap <C-b> :NERDTreeToggle<CR>
  nnoremap rin :NERDTree %<CR>   "open nerd tree for current dir
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" close nerdtree after file gets opened
" let NERDTreeQuitOnOpen=1
" }}}


" vim airline {{{
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <S-Tab> <Plug>AirlineSelectPrevTab
nmap <Tab> <Plug>AirlineSelectNextTab


" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamenod = ':t'
let g:airline_powerline_fonts = 1
" let g:airline_theme='onedark'
" let g:airline_theme='materialmonokai'
" }}}

" Ulti snip settins {{{
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsSnippetsDir='~/.config/nvim/custom_snippets'
" Setting the search path for snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]
" }}}

" FZF related settings {{{
" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
" let g:fzf_buffers_jump = 1 "It was bit slow
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
nnoremap mm :FZF<CR>
" }}}


nnoremap ,, :Ag<CR>


" Emmet support settings {{{
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
"}}}


" ------------------- coc.nvim setttings --------------
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI

set updatetime=300

" don't give |ins-completion-menu| messages.

set shortmess+=c

" always show signcolumns

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

augroup deoplete_vim
  autocmd!
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" ------------------- coc.nvim setttings end --------------



"{{{Deoplete and ternjs settings

" automatic close the quickfix for suggestions

" -------- changes --------
" augroup deoplete_vim
"   autocmd!
"   autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" augroup END
" -------- changes end --------

" check backspace while completing

" -------- changes --------
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#mappings#manual_complete()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
"
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
" call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
"
" let g:deoplete#sources#tss#javascript_support = 1
" let g:tsuquyomi_javascript_support = 1
" let g:tsuquyomi_auto_open = 1
" let g:tsuquyomi_disable_quickfix = 1
" let g:neomake_javascript_enabled_makers = ['eslint']
" }}}

" for vim neomake
call neomake#configure#automake('rw', 1000)

let g:neomake_place_signs = 1
" Highlight the whole line
let g:neomake_highlight_lines = 1

" augroup my_neomake_signs
"   au!
"   autocmd ColorScheme * hi NeomakeErrorSign ctermbg=pink
" augroup END

" highlight neomake errors differently
highlight NeomakeErrorMsg ctermfg=200 ctermbg=200
let g:neomake_error_sign={'text': 'E>', 'texthl': 'NeomakeErrorMsg'}

" highlight neomake warnings differently
highlight NeomakeWarningMsg ctermfg=227 ctermbg=237
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningMsg'}
" }}}

"Vim rspec settings
" let g:rspec_command = "AsyncRun bin/rspec {spec}"
" let g:rspec_command = "Dispatch rspec {spec}"

" for using iTerm
" let g:rspec_runner = "os_x_iterm"
noremap <leader>t :call RunCurrentSpecFile()<CR>

" setting for vim-closetag {{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
" }}}

" setting for jsx support
let g:jsx_ext_required = 0

"" Javascript syntax highlighting {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:jsx_ext_required = 0 " Allow jsx in normal js files
" }}}


" Vim any-fold settings {{{
" let anyfold_activate=1
" activate anyfold by default

" augroup anyfold
"     autocmd!
"     autocmd Filetype <filetype> AnyFoldActivate
" augroup END

" disable anyfold for large files
let g:LargeFile = 1000000 " file is large if size greater than 1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
" function LargeFile()
"     augroup anyfold
"         autocmd! " remove AnyFoldActivate
"         autocmd Filetype <filetype> setlocal foldmethod=indent " fall back to indent folding
"     augroup END
" endfunction

" hi Folded term=NONE cterm=NONE
set foldlevel=99
" }}}


set statusline+=%#warningmsg#
set statusline+=%*

" better space for removing spaces
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" {{{ Vim-Fugitive
noremap gst :Gstatus <CR>
