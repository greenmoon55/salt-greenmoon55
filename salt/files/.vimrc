set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
"Bundle 'suan/vim-instant-markdown'
Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
"Bundle 'mattn/emmet-vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'tpope/vim-fugitive.git'


filetype plugin indent on     " required!

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
" set smarttab

set shiftwidth=2
set tabstop=2
set softtabstop=2
set cindent
set mouse=a
set nonumber
set t_Co=256 " for vim-airline
set ignorecase
set smartcase
syntax on

set background=dark
" colorscheme solarized

autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4

map <C-n> :NERDTreeToggle<CR>
let g:syntastic_check_on_open=1

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Use syntastic for python syntax checking
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E126,E127'

" Enable airline
set laststatus=2

"let g:jedi#completions_command = "<C-N>"



"https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" End of auto paste
