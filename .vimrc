" Tabs
set tabstop=4
set expandtab

" Appearance
syntax on
set number
set showcmd
set lazyredraw
set showmatch
set numberwidth=4
set cursorline

" Filetype detection
filetype indent on

" Wild menu
set wildmenu

" Search
set incsearch
set hlsearch

" Remove search highlight
nnoremap <space> :nohlsearch<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0)) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0)) * 2/3)<CR>
" not working...
nnoremap <C-W>T :term<CR> 



" Plugins
" =======
"
" Install plugin manager vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin directory
call plug#begin('~/.vim/plugged')

" Color theme
Plug 'joshdick/onedark.vim'

" Plugins
Plug 'preservim/nerdtree'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'

set encoding=UTF-8

call plug#end()

color onedark

" Keyboard Shortcuts
map <C-b> :NERDTree<CR>

" set omnifunc=jedi#completions
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-o>"
