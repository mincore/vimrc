set nocompatible	" not compatible with the old-fashion vi mode
set bs=2			" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set updatetime=100	" useful when update taglist
set ruler			" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set hlsearch		" search highlighting
set incsearch		" incremental search
set cursorcolumn	" Highlight the screen column of the cursor with CursorColumn
set laststatus=2	" always show the statusline
set number

"default indent setttings, see http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set cindent

"tmp file
set nobackup
set nowritebackup
set noswapfile

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

syntax on
color desert

"encoding settings
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
nmap <F1> :BufExplorer<CR>

" set leader to ,
let mapleader=","
let g:mapleader=","

" keymaps
nmap <leader>/ :nohl<CR>
nmap <leader>m :make<CR>

" show-invisibles
set list
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ 

" reload vimrc
nmap <leader>r :source $MYVIMRC<CR>

" quickfix
map <leader>p :cp<CR>
map <leader>n :cn<CR>

" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt


" BUFREADPOST settings
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"vundle start
filetype off	" required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'	"[F1] open buffer files
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'	"[,cc ,cu] comment lines
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'			"[ctrl+p] search file
Plugin 'tpope/vim-surround'			"[cs('] easily delete, change and add surroundings
Plugin 'Lokaltog/vim-easymotion'	"[<leader><leader>f] location word
Plugin 'mincore/gtags-cscope.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'DoxygenToolkit.vim'
Plugin 'DrawIt'
call vundle#end()            " required
filetype plugin indent on    " required
"vundle end

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" supertab complete search order
set complete=.,w,b,u,U,t

" tagbar settings
nnoremap <silent> <F6> :TagbarToggle<CR>
let g:tagbar_left=1

" NERDTREE settings
nnoremap <silent> <F7> :NERDTreeToggle<CR>
"let NERDTreeWinSize=16
let NERDTreeWinPos="right"

" DoxygenToolkit setttings
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="csp"
let g:DoxygenToolkit_briefTag_pre = ""
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_briefTag_post = "- "
let g:DoxygenToolkit_paramTag_pre="@"
let g:DoxygenToolkit_paramTag_post=": "
map <F3>a :DoxAuthor<CR>
map <F3>f :Dox<CR>
map <F3>b :DoxBlock<CR>

" gtags-cscope settings
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1

let g:UltiSnipsExpandTrigger="<c-j>"
