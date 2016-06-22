map! <C-S> nil

" make default not compatible with vi
set nocompatible
" set backspace=indent,eol,start

if has("vms")
    set nobackup          " do not keep a backup file, use versions instead
else
	  
    set backup
    set undofile
endif

set history=500
set showcmd			" display incompatible commands

" for search
set incsearch
set hls
set ignorecase
set smartcase

set background=dark

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.

inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).

if &t_Co > 2 || has("gui_running")
syntax on

" I like highlighting strings inside C comments.

let c_comment_strings=1
endif

set autoindent
set linebreak			" doesn't break line, just wraps
set breakindent			" indent on wrapped lines
set breakindentopt=shift:2

set shiftwidth=4		" tab length, 4 characters
set softtabstop=4

set sidescroll=5
set listchars+=precedes:<,extends:>
"for cursor keys and backspace to ignore wrap
set backspace=indent,eol,start whichwrap+=<,>,[,]
inoremap <silent> <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>
inoremap <silent> <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>

packadd matchit

" to use copy and paste from x-clipboard

vnoremap <C-C> :w !xclip <CR>	    "copies entire line only, or user mouse selction and mouse copy
noremap <C-V> :r !xclip -o <CR>

" CTRL-A is copy-all to x-clipboard
noremap <C-A> :w !xclip <CR>

" EXIT & SAVE
nmap q :q <CR>
nmap Q :q! <CR>
noremap <F2> :w! <CR> 
inoremap <F2> <C-O>:update<CR>
noremap <F10> :wq <CR>
inoremap <F10> <C-O>ZZ<CR>
" Easy Movements
noremap <Down> <C-E>
noremap <Up> <C-Y>

" always show status-bar
set laststatus=2
" Format the status line
set statusline=\ %F%m%r%h\ .\%{&filetype}\ %w\ \ CWD:\ %r%{getcwd()}%h\ \%=\ Lines:\ %l/%L\ \ Columns:\ %c%V\ %P

colorscheme seti		" seti gives best contrast with light background
set background=light

let mapleader = ','
let g:mapleader = ','

" use spell checking
" ]s next, [s previous, zg good word, z= give suggestions, :set nospell for no spellcheck
map <leader>ss :set spell spelllang=en_us <cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader>ns :set nospell <cr>

" to stop highlighting after search using / or ?
map <leader>h :let @/="" <cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"for menu
source $VIMRUNTIME/menu.vim
set wildmenu
set wildmode=longest:full,full
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>
