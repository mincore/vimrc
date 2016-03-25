set nocompatible     " not compatible with the old-fashion vi mode
set bs=2             " allow backspacing over everything in insert mode
set history=50       " keep 50 lines of command line history
set updatetime=100   " useful when update taglist
set ruler            " show the cursor position all the time
set autoread         " auto read when file is changed from outside
set hlsearch         " search highlighting
set incsearch        " incremental search
set smartcase        " when searching try to be smart about cases
set laststatus=2     " always show the statusline
set hid              " a buffer becomes hidden when it is abandoned
set number           " show the line number
"set so=7             " set 7 lines to the cursor - when moving vertically using j/k
set magic            " for regular expressions turn magic on
set showmatch        " Show matching brackets when text indicator is over them
set mat=2            " How many tenths of a second to blink when matching brackets

" default indent setttings, see http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set cindent
set smartindent

" tmp file
set nobackup
set nowritebackup
set noswapfile

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" wildmode
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" color
syntax on
color desert
set t_Co=256
set background=dark

" encoding
set fenc=cp936
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp936,big5,gb2312
set fileformats=unix,dos

" doubleword backspace
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

" paste mode switch
set pastetoggle=<F10>

" set leader to ,
let mapleader=","
let g:mapleader=","

" keymaps
nmap <leader>/ :nohl<CR>
nmap <leader>m :make<CR>

" show-invisibles
set listchars=tab:▸\ ,trail:·
nmap <leader>v :set list!<CR>: set cursorcolumn!<CR>

" reload vimrc
nmap <leader>rv :source $MYVIMRC<CR>

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null

nmap <silent> <C-H> :tabprev<CR>
nmap <silent> <C-L> :tabnext<CR>
nmap <silent> <S-H> :wincmd h<CR>
nmap <silent> <S-L> :wincmd l<CR>
nmap <silent> - <PageUp>
nmap <silent> = <PageDown>

 " Remap VIM 0 to first non-blank character
map 0 ^

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>tn :tabnew 

 " Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

 " Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" BUFREADPOST settings
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"vundle start
filetype off    " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'   "[,cc ,cu] comment lines
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'         "[ctrl+p] search file
Plugin 'tpope/vim-surround'         "[cs'] easily delete, change and add surroundings
Plugin 'Lokaltog/vim-easymotion'    "[<leader><leader>f] location word
Plugin 'mincore/gtags-cscope.vim'
Plugin 'mincore/vim-ttcn'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'DoxygenToolkit.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'DrawIt'
Plugin 'mru.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'asciidoc.vim'
Plugin 'lyuts/vim-rtags'
Plugin 'fatih/vim-go'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()            " required
filetype plugin indent on    " required
"vundle end

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" supertab complete search order
set complete=.,w,b,u,U,t

" tagbar settings
nnoremap <silent> <F6> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 1

" NERDTREE settings
nnoremap <silent> <F7> :NERDTreeToggle<CR>
let NERDTreeWinPos="right"

" DoxygenToolkit setttings
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="csp"
let g:DoxygenToolkit_briefTag_pre = ""
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_briefTag_post = "- "
let g:DoxygenToolkit_paramTag_pre="@"
let g:DoxygenToolkit_paramTag_post=": "
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>

" gtags-cscope settings
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1

let g:UltiSnipsExpandTrigger="<c-j>"

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <F1> :BufExplorer<CR>

"""""""""""""""""""""""""""""
" => MRU plugin
"""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>tf :MRU<CR>


"""""""""""""""""""""""""""""
" => CTRL-P
"""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>p :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = '^\.git\|^\.coffee'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
noremap <silent> <leader>z :Goyo<cr>

set tags=/home/csp/tags/tags

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
function! VisualSelection(direction, extra_filter) range
   let l:saved_reg = @"
   execute "normal! vgvy"

   let l:pattern = escape(@", '\\/.*$^~[]')
   let l:pattern = substitute(l:pattern, "\n$", "", "")

   if a:direction == 'b'
       execute "normal ?" . l:pattern . "^M"
   elseif a:direction == 'gv'
       call CmdLine("Ack \"" . l:pattern . "\" " )
   elseif a:direction == 'replace'
       call CmdLine("%s" . '/'. l:pattern . '/')
   elseif a:direction == 'f'
       execute "normal /" . l:pattern . "^M"
   endif

   let @/ = l:pattern
   let @" = l:saved_reg
endfunction

autocmd BufWrite * :call TrimTabOrSpace()
func! TrimTabOrSpace()
  let fts = ['c', 'cpp', 'python']
  if index(fts, &filetype) != -1
    exe "normal mz"
    %s/\s\+$//ge
    %s/\t/    /ge
    exe "normal `z"
  endif
endfunc

autocmd BufNewFile *.h,*.hpp :call AddFileHeaderProtection()      
func AddFileHeaderProtection()
    let l:filename = substitute(expand("%"), "[\\./]", "_", "g")
    call setline(1, "#ifndef _" . toupper(l:filename))
    call setline(2, "#define _" . toupper(l:filename)) 
    call setline(3, "")
    call setline(4, "")
    call setline(5, "")
    call setline(6, "#endif")
    call AddAuthorInfomation()
endfunc

autocmd BufNewFile *.c,*.cpp,*.cxx,*.cc :call AddAuthorInfomation()      
func AddAuthorInfomation()
    call append(0, "/* =====================================================================")
    call append(1, " * Copyright (C) " . strftime("%Y") . " chen shuangping. All Rights Reserved")
    call append(2, " *    Filename: " . expand("%"))
    call append(3, " * Description: ")
    call append(4, " *     Created: " . strftime("%c"))
    call append(5, " *      Author: csp@kuangzhitech.com")
    call append(6, " * =====================================================================")
    call append(7, " */")
    call cursor(4, 17, 0)
endfunc

autocmd BufRead *.ttcn3 call OnTtcnLoaded()
func OnTtcnLoaded()
  set filetype=ttcn
endfunc
