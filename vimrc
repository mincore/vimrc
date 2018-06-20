
call plug#begin('~/.vim/plugged')
Plug 'mincore/my.vim'
Plug 'mincore/gtags-cscope.vim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'rust-lang/rust.vim'
Plug 'ervandew/supertab'
call plug#end()

" tagbar settings
nnoremap <silent> <F6> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 1

" NERDTREE settings
nnoremap <silent> <F7> :NERDTreeToggle<CR>
let NERDTreeWinPos="right"

" gtags-cscope settings
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
