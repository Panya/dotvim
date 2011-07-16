set nocompatible
set autoread
set nobackup
set noswapfile

if &t_Co > 2 || has("gui_running")
    syntax on
    set t_Co=256
endif

set number
set ruler

" Set encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

" Hide menus and other crap
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

" Show edit mode
set showmode

" Use the same symbols as TextMate for tabstops and EOLs
set list listchars=tab:▸\ ,eol:¬,trail:·

" Shortcut to rapidly toggle `set list`
nmap <Leader>l :set list!<CR>

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Highlight color in visual mode
highlight Visual guibg=#414547

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Remapping mapleader
let mapleader=','

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

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

" Leader-c to toggle comments
map <Leader>c <plug>NERDCommenterToggle<CR>
imap <Leader>c <Esc><plug>NERDCommenterToggle<CR>i

" Leader-t and Leader-tb to FuzzyFinderFile and FuzzyFinderBuffer
map <Leader>t :FufFile<CR>
map <Leader>tb :FufBuffer<CR>

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

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color lucius

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" TextMate style identation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

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
