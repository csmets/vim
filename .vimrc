set nocompatible

filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

"use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file
autocmd! bufwritepost * set noexpandtab | retab! 4

set number

set nowrap

set textwidth=0 wrapmargin=0

set colorcolumn=80

" Read nunjucks files
au BufReadPost *.njk set syntax=html

call plug#begin()

Plug 'https://github.com/pangloss/vim-javascript.git'

Plug 'https://github.com/vim-syntastic/syntastic.git'

Plug 'elzr/vim-json'

Plug 'https://github.com/scrooloose/nerdtree.git'

Plug 'justincampbell/vim-eighties'

call plug#end()

let g:javascript_plugin_flow = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_eslint_exec = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
let g:eighties_bufname_additional_patterns = ['fugitiveblame'] " Defaults to [], 'fugitiveblame' is only an example. Takes a comma delimited list of bufnames as strings.
