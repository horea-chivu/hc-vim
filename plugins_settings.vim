"------------------Plugins Settings------------------"

"----NERDTree

" Shortcut for NERDTree activation
nmap <Leader>1 :NERDTreeToggle<Enter>

" Resolve '-' key conflict with Vinegar
let NERDTreeHijackNetrw = 0

" Close NERDTree if is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Default arrows
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


"----ctrlpvim

" Shortcut for searching methods
nmap <M-o> :CtrlPBufTag<Enter>
nmap <M-i> :CtrlPTag<Enter>
nmap <M-u> :CtrlPMRUFiles<Enter>
let g:ctrlp_custom_ignore = {
            \ 'dir': 'node_modules\|vendor\|DS_Store\|\.git'
            \ }
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"----vim-php-namespaces

" Inserts use statement for the namespace automaticly for you(with ctags)
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" Inserts a fully qualified name
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


"----emmet

let g:user_emmet_leader_key='<C-Z>'


"----ultisnips

let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"

"----vim-autoformat
noremap <F3> :Autoformat<CR>


"----vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

if ! has("gui_running")
    set timeoutlen=1000 ttimeoutlen=0
else
    let g:airline_theme='solarized'
endif

" let g:airline_powerline_fonts = 1


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''


"----syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']


