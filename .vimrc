" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"  __ __   ___   ____     ___   ____  __  _____     __ __  ____  ___ ___ 
" |  |  | /   \ |    \   /  _] /    ||  |/ ___/    |  |  ||    ||   |   |
" |  |  ||     ||  D  ) /  [_ |  o  ||_ (   \_     |  |  | |  | | _   _ |
" |  _  ||  O  ||    / |    _]|     |  \|\__  |    |  |  | |  | |  \_/  |
" |  |  ||     ||    \ |   [_ |  _  |    /  \ |    |  :  | |  | |   |   |
" |  |  ||     ||  .  \|     ||  |  |    \    |     \   /  |  | |   |   |
" |__|__| \___/ |__|\_||_____||__|__|     \___|      \_/  |____||___|___| 

" How to work with the folds:
" - zo - open
" - zc - close
" - zR - open all
" - zM - close all
" 
" You can customize these configurations if you create suplimentary files:
" - .vimrc.user.before => configurations that load before .vimrc
" - .vimrc.user.after => configurations that load after .vimrc
" - .vimrc.user.plugins => configurations where you can load more plugins
" The files from above will not be affected by updates!


" Use before config {
    if filereadable(expand("~/.vimrc.user.before"))
        source ~/.vimrc.user.before
    endif
" }

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " be iMproved, required        
        if !WINDOWS()
            set shell=/bin/bash
        endif
    " }

" }

" General {

    

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting

    " Use mouse functionality if available
    if has('mouse') 
            set mouse=a 
    endif

    " Set leader key to <,>
    let mapleader=","			

    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving

    " Restore cursor to file position in previous editing session
    " To disable this, add the following to your .vimrc file:
    "   let g:spf13_no_restore_cursor = 1
    if !exists('g:spf13_no_restore_cursor')
        function! ResCur()
            if line("'\"") <= line("$")
                silent! normal! g`"
                return 1
            endif
        endfunction

        augroup resCur
            autocmd!
            autocmd BufWinEnter * call ResCur()
        augroup END
    endif

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

    " }

" }


" Vim UI {

    
    " set foldmethod=indent
    syntax enable				
    " GUI or not-GUI
    if has("gui_running") 
        set background=dark         " Assume a dark background
        colorscheme atom-dark

        " Allow to trigger background
        function! ToggleBG()
            let s:tbg = &background
            " Inversion
            if s:tbg == "dark"
                set background=light
                colorscheme hemisu
            else
                set background=dark
                colorscheme atom-dark
                hi vertsplit guifg=bg guibg=black
            endif
        endfunction
        noremap <leader>bg :call ToggleBG()<CR>
    else 
        " Non-GUI (terminal) colors 
        " colorscheme jellybeans
        set background=dark
        colorscheme hemisu
    endif

    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 15		" Font and size

    set guioptions-=T "remove toolbar
    set guioptions-=r "remove right-hand scroll bar
    set guioptions-=L "remove left-hand scroll bar. Fix for TagBar.

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    " highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=5		    " Space between lines
    set number                      " Show current line number
    set relativenumber              " Show relative line numbers

    " Set line number bg to general background
    hi LineNr guibg=bg			
    
    " Split separator color customize
    hi vertsplit guifg=bg guibg=black

    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=6                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }


" Formatting {

    " set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" }


"-----------Visuals------------"



" Mappings {

    " Set leader key to <,>
    let mapleader=","			

    " Shortcut for .vimrc file
    nmap <Leader>ev :tabedit $MYVIMRC<Enter>	

    " Shortcut for ~/vim/plugins.vim file
    nmap <Leader>ep :tabedit ~/.vim/plugins.vim<Enter>	

    " Shortcut for Vundle Plugins Installation
    nmap <Leader>ei :PluginInstall<Enter>	

    " Shortcut for highlight removal
    nmap <Leader><space> :nohlsearch<Enter>

    " Press jj twice instead of ESC
    inoremap jj <ESC>

    " copy and paste
    vmap <C-c> "+yi
    vmap <C-x> "+c
    vmap <C-v> c<ESC>"+p
    imap <C-v> <ESC>"+pa

    " ----Mapping for CTags

    nma <Leader>f :tag<space>

    " Close the tab
    nmap <Leader>tc :tabc<Enter>    

    " Next tab
    nmap <Leader>r :tabn<Enter>

    " Previous tab
    nmap <Leader>w :tabp<Enter>

    " Switch between tabs
    nmap <C-tab> <esc>:tabn<CR>

    " Easier movement between splits
    nmap <C-J> <C-W><C-J>
    nmap <C-K> <C-W><C-K>
    nmap <C-H> <C-W><C-H>
    nmap <C-L> <C-W><C-L>

" }


"-----------Plugins------------"

" Source a sepparate .vim file that contans the list of plugin
so ~/.vim/plugins.vim


" Plugins Settings {

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
    nmap <D-R> :CtrlPBufTag<Enter>
    nmap <D-e> :CtrlPMRUFiles<Enter>
    " let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
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


"----vim-airline
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    if ! has("gui_running") 
        set timeoutlen=1000 ttimeoutlen=0
    else
        let g:airline_theme='solarized'
    endif

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#show_splits = 0
    let g:airline#extensions#tabline#show_tabs = 1
    let g:airline#extensions#tabline#show_tab_nr = 0
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#close_symbol = '×'
    let g:airline#extensions#tabline#show_close_button = 0


"----syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_javascript_checkers = ['eslint']

" }

"-----------Auto-Commands------------"

" Automaticlly source the .vimrc file
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
 
" Use after config {
    if filereadable(expand("~/.vimrc.user.after"))
        source ~/.vimrc.user.after
    endif
" }

"########################### Notes #################################
" - In snippets files, press 'ne' to expand a snippet.
" - Use :redo do redo a change.
" - Vinegar
"	- '-' to go to the parrent dir
"	- '%' to create a file
"	- 'd' to create a dir
"	- 'D' to delete a file or a dir
"	- 'R' to rename a file or a dir
"	- 'x' to execute a file
"
" - Emmet
"       - <C-z><leader> to trigger the command
"
" - UltiSnip
"       - ctrl-d to expand the snippet
"       - ctrl-d to move forward
"       - ctrl-a to move backwards
"       - php-snippet plugin will provide the snippets
"       - YouCompleteMe will show the snippet completions
"
" - Ctags
"	- eg: ctags -R --exclude=node_modules|vendor
"
" - vim-php-namespace
"	- we will need ctags
"	- remaped to leader-Previousn
