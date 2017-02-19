filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"-----------Plugins------------"

"---- File explorers

" allows you to explore your filesystem and to open files and directories
Plugin 'scrooloose/nerdtree'

" enhances netrw(default vim file explorer)
Plugin 'tpope/vim-vinegar'



"---- UI and visual code utilities:

" lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'

" themes for vim-airline
Plugin 'vim-airline/vim-airline-themes'

" full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'

" the best Git wrapper of all time
Plugin 'tpope/vim-fugitive'

" shows a git diff in the 'gutter' (sign column)
Plugin 'airblade/vim-gitgutter'

" a syntax checking plugin for Vim
Plugin 'scrooloose/syntastic'

" format code with one button press
Plugin 'Chiel92/vim-autoformat'

" highlights the matching HTML tag when the cursor is positioned on a tag
Plugin 'gregsexton/matchtag'

" greatly improves HTML and CSS writing
Plugin 'mattn/emmet-vim'

" highlights with colors the hexa CSS values and rgb and rgba color
Plugin 'ap/vim-css-color'

" to comment/uncomment multiple lines of code
Plugin 'scrooloose/nerdcommenter'

" for inserting "use" statements automatically
Plugin 'arnaud-lb/vim-php-namespace'

" Generate ctags when you save a file in a project with ctags generated
Plugin 'craigemery/vim-autotag'



"---- Code autocomplition and snippets:

" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim
Plugin 'Valloric/YouCompleteMe'

" improved PHP omni-completion. Based on the default phpcomplete.vim
Plugin 'shawncplus/phpcomplete.vim'

" provide auto-completions for wordpress PHP files
Plugin 'dsawardekar/wordpress.vim'

" UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast
Plugin 'SirVer/ultisnips'

" contains snippets files for various programming languages
Plugin 'honza/vim-snippets'

" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
Plugin 'tpope/vim-surround'



"---- Improved syntax:

" updated version of the php.vim syntax file distributed with Vim
Plugin 'StanAngeloff/php.vim'

" provides syntax highlighting and improved indentation
Plugin 'pangloss/vim-javascript'

" syntax file and other settings for TypeScript
Plugin 'leafgarland/typescript-vim'

" syntax highlighting for Pug (formerly Jade) templates
Plugin 'digitaltoad/vim-pug'



" Use plugins config
    if filereadable(expand("~/.vimrc.user.plugins"))
        source ~/.vimrc.user.plugins
    endif

"-----------endPlugins------------"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

