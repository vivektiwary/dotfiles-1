"" Mapping for removing highlighting
nnoremap <leader><space> :noh <CR>

noremap <leader>o :only<CR>
nnoremap <leader>w :w<CR>
vnoremap <leader>w <Esc>:w<CR>gv
inoremap <leader>w <Esc>:w<CR>

nnoremap <leader>q :wq<CR>
vnoremap <leader>q <Esc>:wq<CR>gv
inoremap <leader>q <Esc>:wq<CR>

" mapping esc key to jk
inoremap jk <esc>
" removing esc key property to learn new mapping
inoremap <esc> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Search in visula mode
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" bind cp command to copy the path of the current file
nnoremap cp :let @+ = expand("%")<CR>

" Buffer related settings {{{
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

"" mapping leader for buffer switch
noremap <Leader>a :bprev<Return>
noremap <Leader>s :bnext<Return>
noremap <Leader>d :bd<Return>
" map <Leader>f :b
nmap <leader>f :NERDTreeFind<CR>
" noremap <leader>q :buffers<Return>:buffer

" Listing all the buffers
noremap <Leader><Enter> :Buffers <CR>
" }}}


" mapping git diff
noremap <leader>g :Gdiff<Return>

" mapping :vnew
noremap <leader>v :vnew<CR>

" next and previous errors
noremap <leader>n :lnext <CR>
noremap <leader>p :lprev <CR>


"" For macro playing
nnoremap <Space> @q


noremap <leader>b :Rg <C-R><C-W><CR>


" Indenting the whole file
nnoremap <leader>i :normal gg=G<cr>
