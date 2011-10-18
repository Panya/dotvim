set nocompatible
set autoread
set nobackup
set noswapfile

" Pathogen init
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif
set t_Co=256
color mustang

hi CursorLine cterm=none
hi Visual ctermbg=237
hi NonText ctermbg=none guibg=#202020
hi SpecialKey ctermbg=none guibg=#202020

" Interface
set number
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set cursorline

" Set encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

" Hide buffers
set hidden

" Don't update the display while executing macros
set lazyredraw

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Indentation
set autoindent
set smartindent
set copyindent

" Set folding off
set nofoldenable

" Show edit mode
set showmode

" Show (partial) command in the status line
set showcmd

" Use modeline overrides
set modeline
set modelines=10

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use the same symbols as TextMate for tabstops and EOLs
set list listchars=tab:▸\ ,eol:¬,trail:·

" Don't continue coments on new line
set formatoptions-=o

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set magic
nnoremap <silent><space> :noh<CR>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Scrolling
set scrolloff=999
set ttyfast

" Status bar
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y]%=file=%{&fileencoding}\ enc=%{&encoding}\ 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=\ \ \ %=%-10.(%l,%c%V%)\ %p%%/%L

fun! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

fun! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" No bell sound
set novisualbell
set t_vb=

" Split windows
set splitbelow
set splitright

" Remapping mapleader
let mapleader=','

" gf in new tab
nnoremap gf <c-w>gf

" be consistent with capitalized C and D commands which reach the end of line
nnoremap Y y$

" Clear trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Pasting
nmap ]p p=`]
nmap ]P P=`[
nmap <silent> <leader>p :set invpaste<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Leader-t to CtrlP and Leader-tb to CtrlP buffers mode
map <Leader>t :CtrlP<CR>
map <Leader>tb :CtrlPBuffer<CR>

" Map Leader-# to switch tabs
map  <Leader>0 0gt
imap <Leader>0 <Esc>0gt
map  <Leader>1 1gt
imap <Leader>1 <Esc>1gt
map  <Leader>2 2gt
imap <Leader>2 <Esc>2gt
map  <Leader>3 3gt
imap <Leader>3 <Esc>3gt
map  <Leader>4 4gt
imap <Leader>4 <Esc>4gt
map  <Leader>5 5gt
imap <Leader>5 <Esc>5gt
map  <Leader>6 6gt
imap <Leader>6 <Esc>6gt
map  <Leader>7 7gt
imap <Leader>7 <Esc>7gt
map  <Leader>8 8gt
imap <Leader>8 <Esc>8gt
map  <Leader>9 9gt
imap <Leader>9 <Esc>9gt

" C-w k --> ,k etc.
nmap <silent> <Leader>k :wincmd k<CR>
nmap <silent> <Leader>j :wincmd j<CR>
nmap <silent> <Leader>l :wincmd l<CR>
nmap <silent> <Leader>h :wincmd h<CR>

" Open vertical split
nnoremap <silent> <Leader>w :vsplit<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" save on losing focus
au FocusLost * :wa

" Enable omni completion
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" CtrlP configuration
let g:ctrlp_persistent_input=0
let g:ctrlp_split_window=1
let g:ctrlp_working_path_mode=2
let g:ctrlp_max_height=5

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" GitGrep
map <Leader>g :GitGrep<space>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" delimitMate indentation
let delimitMate_expand_cr = 1

function! SmartIndent()
    if delimitMate#WithinEmptyPair()
        return "\<CR>\<ESC>\<UP>$o"
    else
        return "\<CR>"
    endif
endfunction

imap <CR> <C-R>=SmartIndent()<CR>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
