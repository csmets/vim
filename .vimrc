set nocompatible

filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file
command! MakeTags !ctags -R .

"use 4 spaces for tabs
set tabstop=4 shiftwidth=4 expandtab

" Allow to use backspace/delete
set backspace=2

" Set Mouse to scroll
set mouse=a

" allow registers to be used with clipboard
set clipboard=unnamed

set number
highlight LineNr ctermfg=grey ctermbg=black

set nowrap

set autoindent

set textwidth=0 wrapmargin=0

nnoremap <C-l> :call ColorColumnToggle()<cr>

function! ColorColumnToggle()
    if &colorcolumn == 0
        setlocal colorcolumn=80
    else
        setlocal colorcolumn=0
    endif
endfunction

highlight ColorColumn ctermbg=3

" Read nunjucks files
au BufReadPost *.njk set syntax=html

" Set text width for txt and md files
au BufNewFile,BufFilePre,BufRead *.md,*.txt set tw=80 fo+=t wrap

" Vim Plug is used to install the plugins
call plug#begin()

Plug 'https://github.com/pangloss/vim-javascript.git'

Plug 'https://github.com/scrooloose/nerdtree.git'

Plug 'editorconfig/editorconfig-vim'

Plug 'https://github.com/leafgarland/typescript-vim.git'

Plug 'https://github.com/mattn/emmet-vim.git'

Plug 'https://github.com/w0rp/ale.git'

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'https://github.com/apalmer1377/factorus.git'

Plug 'https://github.com/airblade/vim-rooter.git'

Plug 'https://github.com/mxw/vim-jsx.git'

Plug 'mileszs/ack.vim'

Plug 'https://github.com/jceb/vim-orgmode.git'

Plug 'https://github.com/tpope/vim-speeddating.git'

Plug 'https://github.com/vim-scripts/utl.vim.git'

Plug 'https://github.com/tpope/vim-markdown.git'

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'mklabs/split-term.vim'

call plug#end()

" JSX Settings
" Enable for both .js and jsx
let g:jsx_ext_required = 0

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" eighties settings
let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
let g:eighties_bufname_additional_patterns = ['fugitiveblame'] " Defaults to [], 'fugitiveblame' is only an example. Takes a comma delimited list of bufnames as strings.

" typescript settings
let g:typescript_indent_disable = 1

" Emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css,njk,scss EmmetInstall

" Leader
let mapleader=","

" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>t'

" Search and replace shortcut for selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" open Nerdtree with ,d
nmap <leader>d :NERDTreeToggle<CR>

" find the current file in the tree
nmap <leader>f :NERDTreeFind<CR>

nmap <leader>gb :Gblame<CR>

nmap <leader>gd :Gvdiff<CR>

" ignore files
let NERDTreeIgnore = [ '\.pyc$', 'target$[[dir]]', 'dependency-reduced-pom.xml', 'workbench.xmi', 'node_modules', '.settings' ]

" show hidden files
let NERDTreeShowHidden=1

" Status line info bar
set ruler
set laststatus=2
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%y\     "filetype
set statusline+=%c%V:     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

" Ignore these directories
set wildignore+=*/build/**
set wildignore+=*/target/**
set wildignore+=*/bin/**
set wildignore+=*/node_modules/**

" remove file number limit
let g:ctrlp_max_files=0

" directory depth?
let g:ctrlp_max_depth=50

" ctrl p search buffer shall be leader b
nnoremap <leader>b :CtrlPBuffer<CR>

" disable caching
let g:ctrlp_use_caching=0

" use default VCS command to list files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
