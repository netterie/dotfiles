" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" 2/9/15 Adding in order to use Vundle...
" filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" R: vim integration
" Plugin 'Vim-q-plugin'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/R-Vim-runtime' "Vim runtime scripts of file types that include R code

" R: pandoc and markdown
Plugin 'vim-pandoc/vim-rmarkdown'

" snipMate

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'

" Ncm completion (with snippets?) for N-vim
Plugin 'roxma/nvim-completion-manager'
Plugin 'gaalcaras/ncm-R'
" Optional: for snippet support
Plugin 'sirver/UltiSnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line








" SPSS syntax highlighting
au BufNewFile,BufRead *.sps set filetype=spss

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 3/26/13 have changed the if...else code below because I was always
" having backups saved permanently (~ files)
" if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
" else
"  set backup		" keep a backup file
"  endif
set nobackup
set history=100		" keep 100 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

" Always use free source format for Fortran source code.

" let fortran_free_source=1

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set syntax=hd
  set number
  map <F2> <Esc>:syntax on<CR>:set syntax=hd<CR>
  map <F3> <Esc>:syntax on<CR>:set syntax=tex<CR> 
  map <F4> <Esc>:syntax on<CR>:set syntax=fortran<CR> 
  map <F5> <Esc>:syntax on<CR>:set syntax=text<CR> 
" map <F2> <Esc>:if exists("syntax_on")<Bar>syntax off<Bar>else<Bar>syntax on<CR>set syntax=hd<Bar>endif<CR>
endif

set ignorecase
set smartcase
set scrolloff=2
set wildmode=longest,list
set expandtab
set sw=2
set smarttab
set tabstop=4
set shiftwidth=4
set statusline=%F%m%r%h%w\ (FORMAT=%{&ff})\ (ASCII=%03.3b)\ (POS=%4l,%4v)\ (LEN=%L)
set laststatus=2
ab _ <-
nmap ,Sws :s/ /_/gcq
vmap ,Sws :s/ /_/gcq
map <F10> :set invhls<CR>:let @/="<C-r><C-w>"<CR>/<BS>
" command! -nargs=+ Py :r!python -c "from math import *;print <args>"
" Source regularly used abbreviations
nmap <C-tab> :tabnext<CR>
nmap <C-S-tab> :tabprevious<CR>
nmap <C-t> :tabnew<CR>
" function ShortTabLine()
"     let ret = ''
"     for i in range(tabpagenr('$'))
"         " select the color group for highlighting active tab
"         if i + 1 == tabpagenr()
"             let ret .= '%#errorMsg#'
"         else
"             let ret .= '%#TableLine#'
"         endif
" 
"         " find the buffername for the tablabel
"         let buflist = tabpagebuflist(i + 1)
"         let winnr = tabpagewinnr(i + 1)
"         let buffername = bufname(buflist[winnr - 1])
"         let filename = fnamemodify(buffername, ':t')
"         " check if there is no name
"         if filename == ''
"             let filename = filename
"         endif
"         " only show the first 6 letters of the name and
"         " .. if the filename is more than 8 letters long
"         if strlen(filename) >= 8
"             let ret .= '['.filename[0:5].'..]'
"         else
"             let ret .= '['.filename.']'
"         endif
"     endfor
" 
"     "after the last tab fill with TabLineFill and reset tab page #
"     let ret .= '%#TabLineFill#%T'
"     return ret
" endfunction
" set tabline=%!ShortTabLine()
" 
" function ShortTabLabel()
"     let bufnrlist = tabpagebuflist(v:lnum)
"     " only show the first 6 letters of the name
"     let label = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
"     let filename = fnamemodify(label,':h')
"     " only add .. if the filename is more than 8 letters long
"     if strlen(filename) >= 8
"         let ret .= filename[0:5].'..'
"     else
"         let ret .= filename
"     endif
"     return ret
" endfunction
" set guitablabel=%{ShortTabLabel()}


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd BufEnter *.hpf set syntax=fortran

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" As per the directions for snipMate which perhaps does not have autocmd?
:filetype plugin on

" R plugin options
"let vimrplugin_term = "xterm"
"let vimrplugin_underscore = 0
let R_in_buffer = 0
let R_applescript = 1
let R_nvim_wd = 1
let R_latexmk = 0

" R commands
map \hh :call RAction("head")<cr>
map \rtt :call RAction("tail")<cr>
map \rdd :call RAction("dim")<cr>
map \shh :call RAction("show")<cr>
map \ll :call RAction("devtools::load_all()")<cr>

" Mappings added by Jeanette
" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" " double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" " remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>


" More vi shortcuts
map <C-down> o<Esc>

set ai
"display+=lastline

if has("spell")
    " turn spelling on by default
    " set spell

    " toggle spelling with <F7>
    map <F7> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

    " they were using white on white
    highlight PmenuSel ctermfg=black ctermbg=lightgray

    " limit it to just the top 10 items
    set sps=best,10
endif
