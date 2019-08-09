# vim-config  
A useful vim-configration including python, c/c++ auto-completion and syntax analysis  [VIM-HOME](https://www.vim.org)

## How to use

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

## FAQ
1. [win32 installation](https://github.com/vim/vim-win32-installer/releases/tag/v8.1.1830)
2. [gvim with +python](https://blog.csdn.net/weixin_44981444/article/details/89671461)
