<<<<<<< HEAD
## MacOs Install

### install nvim

<https://github.com/neovim/neovim/wiki/Installing-Neovim>


### install vim-plug

<https://github.com/junegunn/vim-plug>

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


### clone nvimrc

    cd ~/.config
    mkdir nvim
    git clone https://github.com/2018WANZ24/nvimrc.git nvim


### PlugInstall

    nvim
    :PlugInstall


## nvimrc
# nvim
My neovim config
<center><img src="https://raw.githubusercontent.com/2018WANZ24/nvimrc/master/demo.png"></center>

## Installation
* Backup your nvimrc:
```
cd ~/.config
mv nvim nvim_back
```
* Install [vim-plug](https://github.com/junegunn/vim-plug)
* Install [npm](https://github.com/npm/cli)
* Install [yarn](https://classic.yarnpkg.com/en/docs/install)
* If you need C/C++/Objective-C language server(coc-clangd), install [clangd](https://clangd.llvm.org/installation)
* Clone this repository:
```
git clone https://github.com/2018WANZ24/nvimrc.git ~/.config/
```
* In nvim, run `:PlugInstall`
