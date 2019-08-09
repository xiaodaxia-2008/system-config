# vim-config  
A useful vim-configration including python, c/c++ auto-completion and syntax analysis  

## How to use

### Install Vim >= 8.0
- See [Vim Installation](https://github.com/vim/vim)  
- Or:
  - [`sudo add-apt-repository ppa:jonathonf/vim`](http://www.theubuntumaniac.com/2018/09/install-vim-810374-on-ubuntu-1604-1804.html)
  - `sudo apt update`
  - `sudo apt install vim`
  
### Preparation  
- Install pynvim with `pip3 install --user --upgrade pynvim`
- Install jedi with `pip3 install --user --upgrade jedi`  

### Install Plugins
- Install vim-plug:   
  [`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`](https://github.com/junegunn/vim-plug)  
- put `.vimrc` in your homepath
- put `.vim/plugins.vim` in your home path  
- open vim and run `:PlugInstall`  
--------------
*Search [Vim Awesome](https://vimawesome.com/) to find a lot of funny and useful vim plugins.*
