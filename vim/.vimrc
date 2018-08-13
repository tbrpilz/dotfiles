scriptencoding utf-8
set encoding=utf-8

set nocompatible
set shiftwidth=2 tabstop=2 noexpandtab
set wrap mouse=a
set dir=$HOME/.vim/tmp backupdir=$HOME/.vim/tmp
set ignorecase smartcase shiftround smartindent
set t_Co=256
set noerrorbells
set number

" Load plugins
source $HOME/.vim/bundle.vim

" Plugin configs

" Look and feel
" set fillchars+=vert:|
set fillchars+=vert:\ 

" Syntax Highlighting
syntax enable

" Color scheme
set background=dark
silent! colorscheme wal
let base16colorspace=256

" Leader
let mapleader = ","

" Find command using rg and fzf
command! -bang -nargs=* Find call fzf#vim#grep('rg --column ==line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "\!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <Leader>-n to nerdtree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Vimtex
let g:vimtex_view_method = 'zathura'

" Fix Python indentation.
autocmd FileType python setlocal shiftwidth=2 tabstop=2

" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Don't remap '#' to avoid smartindent problem
:inoremap # X<BS>#

set laststatus=2

" Use LaTeX rather than plain TeX.
let g:tex_flavor = "latex"

" Airline font population
let g:airline_powerline_fonts = 1