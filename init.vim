set path+=**

set termguicolors

set expandtab
set tabstop=2  " number of spaces a <TAB> counts for when reading a file
set softtabstop=2  " number of spaces <TAB> inserts in a file
set shiftwidth=0  " number of spaces to indent using >>; 0 == tabstop
set smartindent

set number relativenumber
set signcolumn=yes
set showmatch
set scrolloff=5  " keep offset of 5 lines for the cursor from top/bottom

set hidden  " allow switching of buffers without writing to the file
set confirm  " confirm when closing unsaved buffers
set shortmess+=c  " Don't pass messages to ins-completion-menu
set updatetime=300  " Write swap file every 300 ms if nothing is written to file

set incsearch  " search as characters are typed
set ignorecase  " case insensitive search
set smartcase  " switch to case sensitive search when upper case character typed
set nohlsearch  " do not highlight search results

set completeopt=menuone,noinsert,noselect

set foldenable
set foldlevelstart=7  " 0 means all folds closed; 99 means all folds open
set foldmethod=syntax

set textwidth=100  " wrap at 100 characters

syntax on
filetype plugin indent on  " Load the ftplugin and indent paths in autoloading

" Backups {{{
set backup
set backupdir=$XDG_DATA_HOME/nvim/.tmp/backup
set undodir=$XDG_DATA_HOME/nvim/.tmp/undo
set directory=$XDG_DATA_HOME/nvim/.tmp/swap
set writebackup
" }}}


call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
	Plug 'tpope/vim-surround'  " operate within surroundings
	Plug 'tpope/vim-commentary'  " comment stuff out
	Plug 'tpope/vim-dispatch'  " run processes asynchronously
    Plug 'tpope/vim-fugitive'  " all the git goodness

	" Plug 'honza/vim-snippets'  " Manage snippets

	Plug 'godlygeek/tabular'  " Align text easily
	Plug 'morhetz/gruvbox'  " Styling
    Plug 'itchyny/lightline.vim'  "  Better status bar

	Plug '/usr/local/opt/fzf'
	Plug 'junegunn/fzf.vim'  " FZF

	Plug 'ap/vim-buftabline'  " Show buffers as tabs

	Plug 'ludovicchabant/vim-gutentags'  " Better tag management

	Plug 'justinmk/vim-sneak'  " Navigate better using 's'

	Plug 'neovim/nvim-lspconfig' " Neovim LSP config
    Plug 'sbdchd/neoformat'  " Format code

	Plug 'nvim-lua/completion-nvim'
	Plug 'norcalli/snippets.nvim'  " Neovim Snippets
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-treesitter/completion-treesitter'

    Plug 'wellle/context.vim'

    Plug 'Exafunction/codeium.vim'
call plug#end()

colorscheme gruvbox

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'currentTime', 'gitbranch', 'readonly', 'filePath', 'modified' ] ]
      \ },
      \ 'component': {
      \   'currentTime': '%{strftime("%H:%M")}',
			\		'filePath': '%{expand("%:.")}'
      \ },
			\ 'component_function': {
			\		'gitbranch': 'FugitiveHead'
			\ }
      \ }


" Set FZF layout to be a lower pop up
let g:fzf_layout = { 'down': '30%' }
" Set width of netrw to be 25%
let g:netrw_winsize = 25


let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

let g:buftabline_numbers = 2
let g:buftabline_indicators = 1

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
 require("lsp-custom") 
EOF

" Completion
let g:completion_enable_snippet = 'snippets.nvim'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_auto_change_source = 1
let g:completion_enable_auto_popup = 0

" vimrc
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet', 'ts' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}

" Neoformat configuration
autocmd BufWritePre *.js Neoformat

