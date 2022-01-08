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

