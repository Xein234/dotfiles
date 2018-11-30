call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'w0rp/ale'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

call plug#end()
"deoplete settings:
let g:deoplete#enable_at_startup = 1

"just-vim settings
set number relativenumber
inoremap <C-j> <Esc>
set completeopt -=preview ""see :h set-=

"tab settings:
filetype plugin indent on
set expandtab softtabstop=4 shiftwidth=4

"ale settings
let g:ale_linters = {'python' : ['mypy', 'pylint']}
"flake8 is a stile linter, and it was reporting errors despite they were only
"a stile issue
highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline
