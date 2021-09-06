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
set hidden
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Filetype detection
filetype indent on

" Wild menu
set wildmenu

" Search
set incsearch
set hlsearch

" Keyboard shortcuts
let mapleader = " " " map leader to space
"nnoremap <space> :nohlsearch<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0)) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0)) * 2/3)<CR>
nmap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>wt :term<CR>
" not working...
map <C-W_T> <Nop><CR> 
nmap <C-W_t> :term<CR> 
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>


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
Plug 'vim-python/python-syntax'
Plug 'Xuyuanp/scrollbar.nvim'
Plug 'vimlab/split-term.vim'

set encoding=UTF-8

call plug#end()

colorscheme onedark

" Keyboard Shortcuts
map <C-b> :NERDTreeToggle<CR>

" set omnifunc=jedi#completions
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-o>"

" Autostart
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnameod = ":t"
let g:python_highlight_all = 1


if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

set mouse+=a
set splitright
set splitbelow
