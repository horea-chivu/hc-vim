"
"  ██░ ██  ▄████▄      ██▒   █▓ ██▓ ███▄ ▄███▓
"  ██░ ██▒▒██▀ ▀█     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▒██▀▀██░▒▓█    ▄     ▓██  █▒░▒██▒▓██    ▓██░
" ░▓█ ░██ ▒▓▓▄ ▄██▒     ▒██ █░░░██░▒██    ▒██
" ░▓█▒░██▓▒ ▓███▀ ░      ▒▀█░  ░██░▒██▒   ░██▒
"  ▒ ░░▒░▒░ ░▒ ▒  ░      ░ ▐░  ░▓  ░ ▒░   ░  ░
"  ▒ ░▒░ ░  ░  ▒         ░ ░░   ▒ ░░  ░      ░
"  ░  ░░ ░░                ░░   ▒ ░░      ░
"  ░  ░  ░░ ░               ░   ░         ░
"         ░                ░
"
" You can customize these configurations if you create suplimentary files:
" - .vimrc.user.before => configurations that load before .vimrc
" - .vimrc.user.after => configurations that load after .vimrc
" - .vimrc.user.plugins => configurations where you can load more plugins
" The files from above will not be affected by updates!


" Use before config
if filereadable(expand("~/.vim.user/.vim.user.before"))
    source ~/.vim.user/.vim.user.before
endif

" Load settings
if filereadable(expand("~/.vim.user/.vim.user.settings"))
    source ~/.vim.user/.vim.user.settings
endif

" Set leader key to <,>
let mapleader=","

" Source a sepparate .vim file that contans custom functions
so ~/.vim/functions.vim

" Environment

" Identify platform
silent function! OSX()
return has('macunix')
        endfunction
        silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

" Un UNIX, use Bash
if !WINDOWS()
    set shell=/bin/bash
endif

" Basics

" If not on neovim, apply basic settings
if !has('nvim')
    set autoindent                  " Indent at the same level of the previous line
    set nocompatible                " be iMproved, required
    set autoread
    set history=1000                " Store a ton of history (default is 20)
    set hlsearch                    " Highlight search terms
    set incsearch                   " Find as you type search
    set wildmenu                    " Show list instead of just completing
    set smarttab
    set tabpagemax=50               " Only show 15 tabs
    filetype plugin indent on       " Automatically detect file types.
    syntax on                       " Syntax highlighting
    if !has("gui_running")
        set t_Co=256
        set term=screen-256color
    endif
endif


" Use mouse functionality if available
if has('mouse')
    set mouse=a
endif

set mousehide                   " Hide the mouse cursor while typing
scriptencoding utf-8
set hidden                      " Allow buffer switching without saving

set guioptions-=m               " Remove menu toolbar
set guioptions-=T               " Remove toolbar
set guioptions-=r               " Remove right-hand scroll bar
set guioptions-=L               " Remove left-hand scroll bar. Fix for TagBar.

set ttyfast                     " Fast cursor
set showmode                    " Display the current mode
set cursorline                  " Highlight current line
highlight clear LineNr          " Current line number row will have same background color in relative mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=5                 " Space between lines
set number                      " Show current line number
set relativenumber              " Show relative line numbers
set nospell                     " Disable spell

" Set line number bg to general background
hi LineNr guibg=bg

set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=6                " Lines to scroll when cursor leaves screen
set scrolloff=6                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Formatting

set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" *.pl stands for Prolog by now
let g:filetype_pl="prolog"

"------------Fonts and Colorschemes-------------"
syntax enable
if !exists('g:hc_light_colorscheme')
    set background=dark                         " Assume a dark background
    colorscheme codeschool
else
    set background=light                         " Assume a dark background
    colorscheme github
endif

if has("gui_running")
    " The font
    set guifont=Monaco\ 14,Monospace\ 14        " Font and size
endif

if has("gui_macvim")
    set guifont=Monaco:h18
endif


"----------Key Mappings--------"

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

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif


nma <Leader>f :tag<space>

" Source a sepparate .vim file that contans the list of plugin
so ~/.vim/plugins.vim

" Source a sepparate .vim file that contans the plugins settings
so ~/.vim/plugins_settings.vim

" Use after config
if filereadable(expand("~/.vim.user/.vim.user.after"))
    source ~/.vim.user/.vim.user.after
endif

" Automaticlly source the .vimrc file
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
