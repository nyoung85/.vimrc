" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" General stuff
syntax on
set number
filetype plugin indent on
" set clipboard = unnamed
" set spell
let spell_auto_type="tex,doc,mail,txt"
set nocompatible 

"Color schemes
set t_Co=256
colorscheme antares
"highlight Normal ctermfg=grey ctermbg=darkblue

"Silence swap file warning
set shortmess+=A


" Buffers
" This allows buffers to be hidden if you've modified a buffer.
 set hidden
"
" " To open a new empty buffer
" " This replaces :tabnew which I used to bind to this mapping
 nmap <leader>T :enew<cr>
"
" " Move to the next buffer
 nmap <leader>l :bnext<CR>
"
" " Move to the previous buffer
 nmap <leader>h :bprevious<CR>
"
" " Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
 nmap <leader>bq :bp <BAR> bd #<CR>
"
" " Show all open buffers and their status
 nmap <leader>bl :ls<CR>


" Pathogen
execute pathogen#infect()

" NerdTree
" autocmd vimenter * NERDTree "opens automatically

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "doesn't keep Vim from quitting
let g:NERDTreeWinSize = 22  " sets window size



"minibufexpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"Vim-latex-live-preview
let g:livepreview_previewer = 'open -a Preview'

" Airline
" Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
"
let g:airline#extensions#tabline#fnamemod = ':t'


" vim-latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
 filetype plugin on
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
" set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
 set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
 filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
 let g:tex_flavor='latex'
 "
