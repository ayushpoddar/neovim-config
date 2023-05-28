"  MAPS NOT PRESENT IN THIS FILE
"  intellisense


"  Non leader key remaps
"  ---------------------
"  Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Shift a line up/down
nnoremap <c-s-j> :m .+1<CR>==
nnoremap <c-s-k> :m .-2<CR>==
inoremap <c-s-j> <Esc>:m .+1<CR>==gi
inoremap <c-s-k> <Esc>:m .-2<CR>==gi
vnoremap <c-s-j> :m '>+1<CR>gv=gv
vnoremap <c-s-k> :m '<-2<CR>gv=gv

" Scrolling
nnoremap <c-u> 5k
vnoremap <c-u> 5k
nnoremap <c-d> 5j
vnoremap <c-d> 5j

" Press jk for escaping insert mode
inoremap jk <esc>
inoremap JK <esc>

" Buffer navigation
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>


" Leader based remaps
" ---------------------

let mapleader=","

" Copy/Paste to/from system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" edit vimrc/zshrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>

" Shortcut for writing to file
nnoremap <leader>s :w<CR>

" <leader>ew will basically help me create file within the same directory
" as the working file
nnoremap <leader>ew :e <C-R>=expand("%:.:h") . "/"<CR>

" Fuzzy search for phrase in current directory (Requires Ag)
nnoremap <leader>f :Ag<CR>
" Search for files
nnoremap <leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Open netrw in the current working directory
nnoremap <leader>n :Vex.<CR>
" Open netrw in the directory of the current file
nnoremap <leader>N :Vex<CR>

" Toggle mouse
nnoremap <silent> <leader>m :call ToggleMouse()<CR>

" List tags present in the current buffer
nnoremap <leader>t :BTags<CR>

" Issue a dipatch command (dispatch.vim)
nnoremap <leader>d :Dispatch!<space>

" Map buffer switching
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(-1)

" Codeium autocompletion remaps
imap <C-'>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-;>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-\>   <Cmd>call codeium#Complete()<CR>


" New commands
" -------------------
"
" Copy the current file path to clipboard
" The relative path to of the file
:command! CopyBuffer let @+ = expand('%:.')

" Source $MYVIMRC easily
:command! Svim source $MYVIMRC
