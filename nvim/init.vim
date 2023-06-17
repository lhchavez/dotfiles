" lhchavez

" Local overrides {{{

if filereadable(expand('~/.vimrc_local'))
    source ~/.vimrc_local
endif

" }}}
" gVim settings {{{

if has('gui_running')
    set guifont=Luculent\ 10
endif

" }}}
" Colors {{{

if exists("g:disable_truecolor") && g:disable_truecolor
    set t_Co=256
    let g:hybrid_custom_term_colors = 1
else
    " Magic incantations to get the correct terminal escapes, regardless of
    " terminal. Needs vim 7.4.1799+.
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors
endif

set background=dark
syntax enable                " enable syntax processing

" }}}
" Misc {{{

" highlight last inserted text
nnoremap gV `[v`]

set encoding=utf-8            " Unicode

" Typo-fixer
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Better tags handling
set tags=./tags;/

" Disable clipboard
let g:clipboard = {
        \   'name': 'tmux',
        \   'copy': {
        \      '+': ['tmux', 'load-buffer', '-'],
        \      '*': ['tmux', 'load-buffer', '-'],
        \    },
        \   'paste': {
        \      '+': ['tmux', 'save-buffer', '-'],
        \      '*': ['tmux', 'save-buffer', '-'],
        \   },
        \   'cache_enabled': 1,
        \ }
set clipboard=unnamed
" }}}
" Spaces & Tabs {{{

set textwidth=100
set tabstop=2                " number of visual spaces per TAB
set softtabstop=2            " number of visual spaces per TAB
set shiftwidth=2
set list

" }}}
" UI Layout {{{

set number              " show line numbers
set showcmd             " show command in bottom bar
set wildmode=list:longest,full
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set scrolloff=5         " keep at least 5 lines above/below
set sidescrolloff=5     " keep at least 5 lines left/right

" }}}
" Searching {{{

set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase          " Case-insensitive search
set smartcase           " But switch to case-sensitive if you add an uppercase

" }}}
" Movement {{{

" make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Ctrl+arrows navigates through windows
map <C-j> <ESC><C-w>h
map <C-j> <ESC><C-w>j
map <C-k> <ESC><C-w>k
map <C-l> <ESC><C-w>l
map! <C-j> <ESC><C-w>h
map! <C-j> <ESC><C-w>j
map! <C-k> <ESC><C-w>k
map! <C-l> <ESC><C-w>l

" make ctrl+cursor move through window panes.
map <ESC>[1;5D <ESC><C-w>h
map <ESC>[1;5B <ESC><C-w>j
map <ESC>[1;5A <ESC><C-w>k
map <ESC>[1;5C <ESC><C-w>l
map! <ESC>[1;5D <ESC><C-w>h
map! <ESC>[1;5B <ESC><C-w>j
map! <ESC>[1;5A <ESC><C-w>k
map! <ESC>[1;5C <ESC><C-w>l

" }}}
" Leader Shortcuts {{{

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/bashrc and load vimrc bindings
nnoremap <leader>rve :vsp $MYVIMRC<CR>
nnoremap <leader>rvs :source $MYVIMRC<CR>
nnoremap <leader>rle :vsp ~/.config/nvim/lua/init.lua<CR>
nnoremap <leader>rls :source ~/.config/nvim/lua/init.lua<CR>
nnoremap <leader>rbe :vsp ~/.bashrc<CR>
nnoremap <leader>rte :vsp ~/.tmux.conf<CR>

" save session
nnoremap <leader>S :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag 

" YCM GoToDefinition
nnoremap <leader>] :YcmCompleter GoToDefinition<CR>

" Pretty-print JSON
nnoremap <leader>j :%!python -m json.tool<CR>:set syntax=json<CR>

" Language Server
nnoremap <leader>ld :LspDefinition<CR>
nnoremap <leader>lt :LspTypeDefinition<CR>
nnoremap <leader>lh :LspHover<CR>
nnoremap <leader>li :LspImplementation<CR>
nnoremap <leader>lf :LspDocumentFormat<CR>
nnoremap <leader>ls :LspStatus<CR>
nnoremap <leader>lr :LspReferences<CR>
nnoremap <leader>len :LspNextError<CR>
nnoremap <leader>leN :LspPreviousError<CR>

" }}}
" AutoGroups {{{

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.vue,*.tpl,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
    autocmd FileType tpl setlocal expandtab
    autocmd FileType tpl setlocal tabstop=2
    autocmd FileType tpl setlocal shiftwidth=2
    autocmd FileType javascript setlocal expandtab
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType smarty setlocal expandtab
    autocmd FileType smarty setlocal tabstop=2
    autocmd FileType smarty setlocal shiftwidth=2
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal tabstop=4
    autocmd FileType php setlocal shiftwidth=4
    autocmd FileType java setlocal tabstop=4
    autocmd FileType java setlocal shiftwidth=4
    autocmd FileType java setlocal textwidth=100
    autocmd FileType lua setlocal expandtab
    autocmd FileType lua setlocal tabstop=2
    autocmd FileType lua setlocal shiftwidth=2
    autocmd FileType lua setlocal textwidth=100
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter Makefile setlocal tabstop=8
    autocmd BufEnter Makefile setlocal shiftwidth=8
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.vue setlocal expandtab
    autocmd BufEnter *.vue setlocal tabstop=2
    autocmd BufEnter *.vue setlocal shiftwidth=2
    autocmd BufEnter *.proto setlocal expandtab
    autocmd BufEnter *.proto setlocal shiftwidth=2
    autocmd BufEnter *.proto setlocal softtabstop=2
augroup END

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" }}}
" Backups {{{

set nobackup       " no backup files
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile     " no swap files

" }}}
" Custom Functions {{{

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" }}}
" per-project .vimrc {{{

set exrc
set secure

" }}}
" Lua {{{
:luafile ~/.config/nvim/lua/init.lua
" }}}

" vim:foldmethod=marker:foldlevel=0:tabstop=4:shiftwidth=4:expandtab
