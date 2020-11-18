# system-config  
A useful system-configration tool for Linux Debian/Deepin system, including installing spacevim, apt-source mirror changing, docker shortcut keys, etc.

# How to use

## Basic usage
run with `python3 install.py -h` to see the help documents.

## Vim configuration
### Install Vim >= 8.0
- See [Vim Installation](https://github.com/vim/vim)  
- Or:
  - [`sudo add-apt-repository ppa:jonathonf/vim`](http://www.theubuntumaniac.com/2018/09/install-vim-810374-on-ubuntu-1604-1804.html)
  - `sudo apt update`
  - `sudo apt install vim`
  
### Preparation  
- Install pynvim with `pip3 install --user --upgrade pynvim`
- Install neovim with `pip3 install --user --upgrade neovim`
- Install jedi with `pip3 install --user --upgrade jedi`  
- Install clang with `sudo apt install clang`

### Install Plugins
- Install vim-plug:   
  [`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`](https://github.com/junegunn/vim-plug)  
- put `.vimrc` in your homepath
- put `.vim/plugins.vim` in your home path  
- open vim and run `:PlugInstall`  
--------------
*Search [Vim Awesome](https://vimawesome.com/) to find a lot of funny and useful vim plugins.*

## Miscellaneous

- `sudo apt install bash-completion` to enable tab completion in your terminal
- `sudo apt install neovim` to install `neovim` before you install spacevim

## FAQ
1. [win32 installation](https://github.com/vim/vim-win32-installer/releases/tag/v8.1.1830)
2. [gvim with +python](https://blog.csdn.net/weixin_44981444/article/details/89671461)
