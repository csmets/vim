set nocompatible

filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

"use 4 spaces for tabs
set tabstop=4 shiftwidth=4 expandtab

" Allow to use backspace/delete
set backspace=2

set number

set nowrap

set textwidth=0 wrapmargin=0

set colorcolumn=80

set autoindent

" Read nunjucks files
au BufReadPost *.njk set syntax=html

" Set text width for txt and md files
au BufNewFile,BufFilePre,BufRead *.md,*.txt set tw=80 fo+=t colorcolumn=80 wrap

" Search and replace shortcut for selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

call plug#begin()

Plug 'https://github.com/pangloss/vim-javascript.git'

Plug 'https://github.com/scrooloose/nerdtree.git'

Plug 'justincampbell/vim-eighties'

Plug 'editorconfig/editorconfig-vim'

Plug 'https://github.com/leafgarland/typescript-vim.git'

Plug 'https://github.com/mattn/emmet-vim.git'

Plug 'https://github.com/w0rp/ale.git'

call plug#end()

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
