set cindent

set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2 tabstop=2
set expandtab
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set number relativenumber
set ruler

set mouse=a

set list listchars=tab:>-,trail:•,extends:>
set showmatch

execute pathogen#infect()
syntax on
filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

set laststatus=2
if !has('gui_running')
      set t_Co=256
endif

if &diff == 'nodiff'
    set shell=/bin/bash\ -i
endif

set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*

set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.git,node_modules,venv,migrations


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_working_path_mode = 'r'

let NERDTreeIgnore = ['\.pyc$']

colors zenburn

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Disable auto-completion...too slow
let g:ale_completion_enabled = 0
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0


call plug#begin('~/.vim/plugged')
Plug 'janko-m/vim-test'
call plug#end()

let test#python#runner = 'pytest'
let test#python#pytest#options = '-n0'
let test#strategy = 'vimterminal'

nmap <silent> t<C-n> :TestNearest<CR>

" No backup files, except temporarily when overwriting
set nobk wb
" No swap files
set noswapfile

