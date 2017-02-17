# Project: hc-vim

## How to install?

Just execute in terminal: `bash <(curl -s https://raw.githubusercontent.com/horea-chivu/hc-vim/master/viminstall)`

Then you will be promted to execute *ubuntu-dependencies* file in order to install required dependencies for vim to work correctly. If you want to do it manually, run the followig command: `bash ~/.hc-vim/ubuntu-dependencies`.

## How to update?

Just execute in your terminal `bash ~/.hc-vim/vimupdate`, and the script will take care of the updates for you(it might take a while becouse of download and compilation of YouCompleteMe). You will probably be promted to run *ubuntu-dependencies* again. Please, do it.

## Other matters

Your old configurations, represented by *~/.vim* directory and *~/.vimrc* file will be moved in **~/.vim_backup** directory.

## Features

1. Gorgeous font(Monaco) and customized colorschemes(github for day, codeschool for night)
2. Modern .vimrc configuration
3. Vundle(plugin manager) support with included plugins
4. File explorers:
    * **scrooloose/nerdtree** - allows you to explore your filesystem and to open files and directories
    * **tpope/vim-vinegar** - enhances netrw(default vim file explorer)
5. UI and visual code utilities:
    * **vim-airline/vim-airline** - lean & mean status/tabline for vim that's light as air
    * **vim-airline/vim-airline-themes** - themes for vim-airline
    * **ctrlpvim/ctrlp.vim** - full path fuzzy file, buffer, mru, tag, ... finder for Vim.
    * **tpope/vim-fugitive** - the best Git wrapper of all time
    * **airblade/vim-gitgutter** - shows a git diff in the 'gutter' (sign column)
    * **scrooloose/syntastic** - a syntax checking plugin for Vim
    * **Chiel92/vim-autoformat** - format code with one button press
    * **gregsexton/matchtag** - highlights the matching HTML tag when the cursor is positioned on a tag
    * **mattn/emmet-vim** - greatly improves HTML and CSS writing
    * **ap/vim-css-color** - highlights with colors the hexa CSS values and rgb and rgba color
    * **scrooloose/nerdcommenter** - to comment/uncomment multiple lines of code
    * **arnaud-lb/vim-php-namespace** - for inserting "use" statements automatically
5. Code autocomplition and snippets:
    * **Valloric/YouCompleteMe** - YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim
    * **SirVer/ultisnips** - UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast
    * **honza/vim-snippets** - contains snippets files for various programming languages
    * **tpope/vim-surround** - Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
6. Improved syntax:
    * **StanAngeloff/php.vim** - updated version of the php.vim syntax file distributed with Vim
    * **pangloss/vim-javascript** - provides syntax highlighting and improved indentation
    * **leafgarland/typescript-vim** - syntax file and other settings for TypeScript
    * **digitaltoad/vim-pug** - syntax highlighting for Pug (formerly Jade) templates

