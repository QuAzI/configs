set nocompatible

" Vundle plugin manager
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/YouCompleteMe
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'mattn/emmet-vim'  " html zen mode by '<c-y>,'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'skanehira/docker-compose.vim'

call vundle#end()
filetype plugin indent on
filetype on
" Vundle plugin manager /* end */
" use :PluginInstall to install all plugins

syntax on

set number  " show line numbers
set nowrap  " don't automatically wrap on load

" set colorcolumn=92  " 92 - half of fullscreen for 16px DejaVu Sans Mono for PS
set colorcolumn=90  " first char after window for half display
colorscheme gruvbox
set background=dark
highlight ColorColumn ctermbg=233
hi Normal guibg=NONE ctermbg=NONE

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab  " replace tabs with spaces
setlocal softtabstop=4
setlocal autoindent
setlocal smartindent
setlocal expandtab
set foldmethod=indent
set nofoldenable

set hlsearch
set incsearch
set ignorecase
set smartcase
set ls=2

" Powerline
" If installed using pip just add
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1

let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E226,W293,W391'

set encoding=utf-8
set fileencodings=utf8,cp1251

set visualbell t_vb=   " disable sound

nnoremap <F1> :YcmCompleter GetDoc<CR> 
nnoremap <F3> :NERDTree<CR>
nnoremap <F4> :TagbarToggle<CR>
nnoremap <F5> :w<CR>:!clear;%<CR>
nnoremap <F7> :Rg<SPACE>
nnoremap <Esc><Esc> :noh<Enter>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap gd :YcmCompleter GoTo<CR>
" check if GoToDefinitionElseDeclaration better for gd
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>r :YcmCompleter RefactorRename  


let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ nnoremap <F5> :w<CR>:!clear;python3 %<CR>


au BufNewFile,BufRead *.html,*.css,*.xaml,*.xml,*.sql
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:docker_compose_open_terminal_way = 'top'

