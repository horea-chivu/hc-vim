# Project: hc-vim

## How to install?

Just execute in terminal: `bash <(curl -s https://raw.githubusercontent.com/horea-chivu/hc-vim/master/viminstall)`

Then you will need to execute *ubuntu-dependencies* file yourself in order to install required dependencies for vim to work correctly: `bash ~/.hc-vim/ubuntu-dependencies`.

## How to update?

Just execute in your terminal `bash ~/.hc-vim/vimupdate`, and the scriptwill take care of the updates for you(it might take a while becouse of download and compilation of YouCompleteMe).

## Other matters

Your old configurations, represented by *~/.vim* directory and *~/.vimrc* file will be moved in **~/.vim_backup** directory.
