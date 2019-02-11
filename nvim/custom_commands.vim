" set marker as fold method in vim
" Vimscript file setttings ---------------------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim set foldlevel=0
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup vim_rc_write
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim silent! !cp % ~/dotfiles/init.vim

  " Sourcing vimrc when written
  autocmd BufWritePost ~/.config/nvim/*.vim :source $MYVIMRC
augroup END

" }}}

" this is a hack as rails vim syntax highlighting
" was somehow not working in the specs.
augroup ruby_file_with_syntax
  autocmd!
  autocmd BufRead *_spec.rb setlocal syntax=on
  autocmd BufRead **/forms/*.rb setlocal syntax=on
augroup END

" Markdown auto folds {{{
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown set foldlevel=0
  autocmd FileType markdown setlocal foldmethod=marker
augroup END

" For mouse events in vim
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  if !has('nvim')
    set ttymouse=xterm2
  endif
end


runtime macros/matchit.vim  " for matching do end in ruby

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
" :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above

" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)
"
"

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" }}}
