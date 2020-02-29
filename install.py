import os
import shutil
import argparse

parser = argparse.ArgumentParser(description="Linux config arguments")
parser.add_argument("-v", "--vim-plug", action="store_true",
                    help="install vim-plug")
parser.add_argument("--vimrc", action="store_true", help="install vimrc")
parser.add_argument("-g", "--git-branch", action="store_true",
                    help="modify .bashrc to show git branch info in terminal")
parser.add_argument("-s", "--sources-list", action="store_true",
                    help="modify sources.list to aliyun mirror for Ubuntu18.04")
parser.add_argument("-d", "--develop-environment", action="store_true",
                    help="install gcc, cmake, pip3, ipython, matplotlib etc.")
parser.add_argument("-p", "--pip-sources", action="store_true",
                    help="change pip source to aliyun mirrors")
args = parser.parse_args()

if args.vim_plug:
    # cmd = "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    # print(cmd)
    # os.system(cmd)
    shutil.copyfile("./plug.vim", "~/.vim/autoload/plug.vim")

if args.vim_plug or args.vimrc:
    cmd = "cp .vimrc ~/"
    print(cmd)
    os.system(cmd)
    cmd = "cp -r .vim ~/"
    print(cmd)
    os.system(cmd)

if args.git_branch:
    os.system("cat .bashrc >> ~/.bashrc")
    os.system("source ~/.bashrc")
    os.system("git config --global credential.helper cache")
    os.system("git config --global user.email 'xiaozisheng2008@qq.com'")
    os.system("git config --global user.name xiaodaxia-2008")

if args.pip_sources:
    os.makedirs("{home}/.pip".format(home=os.environ['HOME']), exist_ok=True)
    with open("{home}/.pip/pip.conf".format(home=os.environ['HOME']), 'w') as f:
        f.write("[global]\r\nindex-url = https://mirrors.aliyun.com/pypi/simple\r\n")

if args.sources_list:
    os.system("sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup")
    os.system("sudo cp sources.list /etc/apt/sources.list")

if args.develop_environment:
    os.system("sudo apt update")
    os.system("sudo apt install build-essential cmake python3-pip exuberant-ctags")
    os.system("sudo apt autoremove")
    os.system("sudo pip3 install ipython matplotlib")
