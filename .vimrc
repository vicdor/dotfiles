set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = "'"
let maplocalleader = "\\"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/TagHighlight'
Plugin 'airblade/vim-gitgutter'
call vundle#end()            " required
filetype plugin indent on

""""""""""""""""""""""""""""""""
"for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_c_checkers = ['make', 'splint']
nnoremap <C-e> :SyntasticCheck<CR>
nnoremap <C-w> :SyntasticToggleMode<CR>

"for nerdtree
map <C-n> :NERDTreeToggle<CR>

" air-line because the fucking arrows don't work
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" easy-motion
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" gitgutter
let g:gitgutter_sign_column_always = 1
set updatetime=250

" buffers
set hidden
nnoremap <Leader>f :bn<cr>
nnoremap <Leader>b :bp<cr>
nnoremap <Leader>x :bd<cr>
"""""""""""""""""""""""""""""""""

syntax on
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set incsearch
set hlsearch
set showmatch
set showcmd
set undofile
set undodir=~/.vim/undodir
set splitbelow
set splitright
set ignorecase
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <c-d> <esc>ddi
nnoremap <space> viw<esc>
nnoremap - ddO<Esc>p
nnoremap <cr> :nohlsearch<cr>
nnoremap U <esc>viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <Space> i<Space><Esc>
nnoremap <leader><leader>a :w<cr>:!pdflatex %<cr><cr>
iabbrev adn and
iabbrev waht what
iabbrev tehn then
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>; mqA;<esc>`q
nnoremap <leader>d "_d
nnoremap <Space> i_<Esc>r
"nnoremap <cr> i<cr><esc>
autocmd FileType java nnoremap <buffer> <leader>c I//<esc>
autocmd FileType c nnoremap <buffer> <leader>c I//<esc>
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
autocmd FileType java inoremap <buffer> if<Space> if ()<left>
autocmd FileType c inoremap <buffer> if<Space> if ()<left>
autocmd FileType java inoremap <buffer> for<Space> for ()<left>
autocmd FileType c inoremap <buffer> for<Space> for ()<left>
autocmd FileType java inoremap <buffer> while<Space> while ()<left>
autocmd FileType c inoremap <buffer> while<Space> while ()<left>
autocmd FileType java inoremap <buffer> {{ <Esc>A<Space>{<CR>}<Esc>O
autocmd FileType c inoremap <buffer> {{ <Esc>A<Space>{<CR>}<Esc>O
autocmd FileType c inoremap <buffer> pp printf("\n");<left><left><left><left><left>
inoremap (( ()<Esc>i
inoremap [[ []<Esc>i
onoremap p i(
onoremap { i{
onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
cmap w!! w !sudo tee % >/dev/null<cr>:e!<cr><cr>
set nocompatible
set noruler
set laststatus=2
set statusline=%.50F    "path of the filename
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%l/%L "cursor column
"set statusline+=%L      "cursor line/total lines
" Vimscript file settings ----------- {{{
augroup filetype_vim
   autocmd!
   autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"colorscheme base16-twilight
set nocp
"let base16colorspace=256
set t_Co=256
set background=dark
set mouse=a
set noswapfile
colorscheme wombat

