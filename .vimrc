" opens new (only new/empty) file in insertmode
au BufNewFile * star
autocmd VimEnter * if empty(expand("%")) | startinsert | endif

" make default not compatible with vi
set nocompatible
"start in insertmode
"startinsert

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

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if &t_Co > 2 || has("gui_running")
syntax on
set cursorline
"set cursorcolumn

" highlighting strings inside C comments.
let c_comment_strings=1
endif

set number
set autoindent
set linebreak			" doesn't break line, just wraps
set breakindent			" indent on wrapped lines
set breakindentopt=shift:2

set shiftwidth=4		" tab length, 4 characters
set softtabstop=4

"set sidescroll=5
set listchars+=precedes:<,extends:>
"for cursor keys and backspace to ignore wrap
set backspace=indent,eol,start whichwrap+=<,>,[,]
" inoremap <silent> <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>
" inoremap <silent> <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>

packadd matchit

" to use copy and paste from x-clipboard
" copies entire line only
vnoremap <C-C> :w !xclip -i <CR>
"!xclip -selection clipboard -i <CR>
noremap <C-V> :r !xclip -o <CR>
noremap Y y$
noremap <F5> gp
"to paste in insert mode (from vim clipboard not x-clipboard)
inoremap <F5> <C-R>"

" CTRL-A is copy-all to x-clipboard
noremap <C-A> :w !xclip -i <CR>
" EXIT & SAVE
noremap <F2> :w! <CR>
inoremap <F2> <C-O>:update<CR>
noremap <F10> :confirm q <CR>
inoremap <F10> <C-O>:confirm q<CR>


" remove trailing white spaces
noremap <F8> :%s/\s\+$//e<CR>

" Easy Movements
noremap <C-Down> <C-E>
inoremap <C-Down> <C-O><C-E>
noremap <C-Up> <C-Y>
inoremap <C-Up> <C-O><C-Y>
map j gj
map k gk
map <Up> gk
map <Down> gj
" select using shift+arrow (starts visual mode)
set keymodel=startsel

" always show status-bar
set laststatus=2
set cmdheight=1
" Format the status line
" Returns true if paste mode is enabled
set statusline=\ %F%m%r%h\ .\%{&filetype}\ %w\ \ CWD:\ %r%{getcwd()}%h\ \%=\ Lines:\ %l/%L\ \ Columns:\ %c%V\ %P
colorscheme seti		" seti gives best contrast with light background
set background=light
let g:airline_theme = 'bubblegum'   "'distinguished' 'bubblegum' = good themes

let mapleader = ','
let g:mapleader = ','

" use spell checking, ,ss=toggles spell check
" ]s next, [s previous, zg good word, z= give suggestions, :set nospell for no spellcheck
map <leader>ss :set spell! spelllang=en<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
"map <leader>ns :set nospell <cr>

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

"for menu
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set wildmenu
set wildmode=longest:full,full
set cpo-=<
set wcm=<C-Z>
noremap <F9> :emenu <C-Z>
inoremap <F9> <C-O>:emenu <C-Z>

" height of help window
set hh=35

"set extra margin on left
"set foldcolumn=1

" use <F1> for help file to search under cursor
map <F1> <ESC>:exec "help ".expand("<cWORD>")<CR>

" to create headline with h1, h2, h3
map h1 yypVr=o
map h2 yypVr-o
map h3 yypVr.o

map <leader>f :NERDTreeToggle <CR>

"select encryption method, use :X to encrypt a file
set cm=blowfish2

set termguicolors

" prevent temporary files accumulation

set noswapfile
set nobackup
