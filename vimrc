let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'bfrg/vim-cpp-modern'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tikhomirov/vim-glsl'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

set tags+=~/code/g3d/tags
set backspace=indent,eol,start

set exrc 
set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd BufRead,BufNewFile *.tsx set filetype=typescript
autocmd BufRead,BufNewFile *.ts set filetype=typescript

autocmd FileType html setlocal ts=2 sw=2 sts=2
autocmd FileType javascript setlocal ts=2 sw=2 sts=2
autocmd FileType typescript setlocal ts=2 sw=2 sts=2 

set expandtab
match Error /\t/

set hlsearch
set showmatch

set colorcolumn=110
highlight ColorColumn ctermbg=lightgray

set number
set laststatus=2

set ignorecase
set smartcase

set wildmode=longest,list
set wildmenu
set viminfo='100,<1000,s100,h

" set mouse+=a
set mouse=a

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" if &term =~ '^screen'
"     " tmux knows the extended mouse mode
"    set ttymouse=xterm2
" endif

augroup project
    autocmd!
    "autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
    autocmd BufRead,BufNewFile *.h,*.c set filetype=cpp
    autocmd BufRead,BufNewFile *.ush,*.usf set filetype=cpp
augroup END

let &path.="src/include,/usr/include/AL,"

set makeprg=./bdr.sh

"set term=xterm-256color

nnoremap <F4> :make!<cr>

"nnoremap <F5> :!./run<cr>

au BufReadPost *.md.html set syntax=markdown

" Window Splitting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" coc.nvim settings follow
"
"
"n

