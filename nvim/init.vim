call plug#begin('~/.local/share/nvim/plugged')
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI. 
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'

" Plug 'w0rp/ale'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
" Plug 'carlitux/deoplete-ternjs'
"ese de ariva no funciona lol ^^^
", { 'do': 'npm install -g tern' }

Plug 'patstockwell/vim-monokai-tasty'
call plug#end()
colorscheme vim-monokai-tasty


"deoplete settings:
let g:deoplete#enable_at_startup = 1

"just-vim settings
set number relativenumber
inoremap <C-j> <Esc>
set completeopt -=preview ""see :h set-=

"tab settings:
filetype plugin indent on
set expandtab softtabstop=2 shiftwidth=2

"ale settings
let g:ale_linters = {'python' : ['mypy', 'pylint'], 'javascript' : ['eslint']}
"flake8 is a stile linter, and it was reporting errors despite they were only
"a stile issue
highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

"" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'java': ['jdtls'],
    \ }

let g:LanguageClient_rootMarkers = ['.root', 'project.*', '.git/']

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

" call deoplete#custom#option('auto_complete_delay', 200)
set completefunc=LanguageClient#complete
call deoplete#custom#option('auto_complete_delay', 0)
