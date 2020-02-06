import os

cmd = "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
print(cmd)
os.system(cmd)

cmd = "cp .vimrc ~/"
print(cmd)
os.system(cmd)

cmd = "cp -r .vim ~/"
print(cmd)
os.system(cmd)

