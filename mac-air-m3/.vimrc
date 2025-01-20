" change leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

set nocompatible

" Vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
" Plugin 'ycm-core/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'dense-analysis/ale'
call plug#end()

" Turn on syntax highlighting.
syntax on
filetype plugin indent on

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
set background=dark    " Setting dark mode
autocmd vimenter * nested colorscheme gruvbox

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=10

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" Autocomplete tab in menu
set wildmenu

" Keep selection after block indent in visual mode
vmap > >gv
vmap < <gv

" Ctrl-direction to switch panes
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" noremap <C-k> <C-w>k

" Quit files
noremap <leader>q :q<cr>

" map : to ;
nnoremap ; :

" change tabs with shift-dir
noremap <S-l> gt
noremap <S-h> gT

" redraw screen + turn off search hl until next search
nnoremap <CR> :noh<CR><CR>

" remap esc to another key
inoremap jj <Esc>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
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
    au BufNewFile,BufRead CMakeLists.txt set filetype=cmake
  endif
endif

set t_Co=256

" Add mouse compatibility
set mouse=a

" NERDTree Shortcut
noremap <C-t> :NERDTreeToggle<CR>

" Set Hidden
set hidden

" try some html autocomplete
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

" FZF bindings
" nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Ag<CR>

" Add column guide
set colorcolumn=80
