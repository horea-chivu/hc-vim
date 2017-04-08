

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"-----------Plugins------------"

"---- File explorers

" allows you to explore your filesystem and to open files and directories
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" enhances netrw(default vim file explorer)
Plug 'tpope/vim-vinegar'



"---- UI and visual code utilities:

if !exists('g:hc_disable_plugin_vim_airline')
    " lean & mean status/tabline for vim that's light as air
    Plug 'vim-airline/vim-airline'

    " themes for vim-airline
    Plug 'vim-airline/vim-airline-themes'
endif

" full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'

" A ctrlp-like plugin that works only in terminal
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" the best Git wrapper of all time
Plug 'tpope/vim-fugitive'

" shows a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

" a syntax checking plugin for Vim
if !exists('g:hc_disable_plugin_syntastic')
    Plug 'scrooloose/syntastic'
endif

" format code with one button press
Plug 'Chiel92/vim-autoformat'

" highlights the matching HTML tag when the cursor is positioned on a tag
Plug 'gregsexton/matchtag'

" greatly improves HTML and CSS writing
Plug 'mattn/emmet-vim'

" highlights with colors the hexa CSS values and rgb and rgba color
Plug 'ap/vim-css-color'

" to comment/uncomment multiple lines of code
if !exists('g:hc_disable_plugin_nerdcommenter')
    Plug 'scrooloose/nerdcommenter'
endif

" for inserting "use" statements automatically
Plug 'arnaud-lb/vim-php-namespace'

" Generate ctags when you save a file in a project with ctags generated
Plug 'craigemery/vim-autotag'



"---- Code autocomplition and snippets:

" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim
if !exists('g:hc_disable_plugin_youcompleteme')
    Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --tern-completer' }
endif

" improved PHP omni-completion. Based on the default phpcomplete.vim
if !exists('g:hc_disable_plugin_phpcomplete')
    Plug 'shawncplus/phpcomplete.vim'
endif

" provide auto-completions for wordpress PHP files
if !exists('g:hc_disable_plugin_wordpress')
    Plug 'dsawardekar/wordpress.vim'
endif

" UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast
if !exists('g:hc_disable_plugin_ultisnips')
    Plug 'SirVer/ultisnips'
endif

" contains snippets files for various programming languages
if !exists('g:hc_disable_plugin_vim-snippets')
    Plug 'honza/vim-snippets'
endif

" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-surround'


"---- Improved syntax:

Plug 'sheerun/vim-polyglot'


" Source user plugins list
if filereadable(expand("~/.vim.user/.vim.user.plugins"))
    source ~/.vim.user/.vim.user.plugins
endif

"-----------endPlugins------------"

" All of your Plugins must be added before the following line
call plug#end()            " required
