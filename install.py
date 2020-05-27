import os
import shutil
import argparse


def RunCmd(cmd, sudo=False):
    print("running cmd:[{}]".format(cmd))
    if sudo:
        os.system(SUDO + cmd)
    else:
        os.system(cmd)


SUDO = "sudo "

home = os.environ["HOME"]

parser = argparse.ArgumentParser(description="Linux config arguments")
parser.add_argument("-v", "--vim-plug", action="store_true",
                    help="install vim-plug")
parser.add_argument("--vimrc", action="store_true", help="install vimrc")
parser.add_argument("-g", "--git-branch", action="store_true",
                    help="modify .bashrc to show git branch info in terminal")
parser.add_argument("-s", "--sources-list", action="store_true",
                    help="modify sources.list to aliyun mirror for Ubuntu18.04")
parser.add_argument("--sources-list-debian10", action="store_true",
                    help="modify sources.list to aliyun mirror for Debian10")
parser.add_argument("-d", "--develop-environment", action="store_true",
                    help="install gcc, cmake, pip3, ipython, matplotlib etc.")
parser.add_argument("--docker-shortcut", action="store_true",
                    help="set docker rumimage/listcontainer, etc. shortcut command")
parser.add_argument("-p", "--pip-sources", action="store_true",
                    help="change pip source to aliyun mirrors")
parser.add_argument("--install-space-vim", action="store_true",
                    help="install space vim")
parser.add_argument("--space-vim", action="store_true",
                    help="copy space vim configuraiton")

parser.add_argument("--install-spacevim", action="store_true",
                    help="install spacevim")
args = parser.parse_args()
if not any(vars(args).values()):
    print("using 'python install.py -h' to get help documention")


if args.vim_plug:
    # Install vim_plug online
    # cmd = "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    # RunCmd(cmd)
    # Install vim_plug offline
    RunCmd("mkdir -p ~/.vim/autoload")
    shutil.copyfile("./plug.vim", home + "/.vim/autoload/plug.vim")

if args.vim_plug or args.vimrc:
    # SpaceVim is preferred
    RunCmd("mkdir -p ~/.vim/autoload")
    RunCmd("pip3 install pynvim")

    RunCmd(
        "sudo apt install vim-gui-common clang-7 clang-tools clang-format universal-ctags")
    shutil.copyfile("./plug.vim", home + "/.vim/autoload/plug.vim")
    cmd = "cp .vimrc ~/"
    RunCmd(cmd)
    cmd = "cp -r .vim ~/"
    RunCmd(cmd)

if args.install_spacevim:
    cmd = "curl -sLf https://spacevim.org/cn/install.sh | bash"
    RunCmd(cmd)

if args.install_space_vim:
    cmd = "cp -r ./.SpaceVim.d ~/"
    RunCmd(cmd)
if args.space_vim:
    cmd = "curl -sLf https://spacevim.org/install.sh | bash"
    RunCmd(cmd)

if args.git_branch:
    RunCmd("cat .bashrc >> ~/.bashrc")
    # RunCmd("source ~/.bashrc")
    RunCmd("git config --global credential.helper cache")
    RunCmd("git config --global user.email 'xiaozisheng2008@qq.com'")
    RunCmd("git config --global user.name xiaodaxia-2008")

if args.docker_shortcut:
    RunCmd("cat .bashrc_docker >> ~/.bashrc")
    print("run 'sudo apt install docker*' to install docker")

if args.pip_sources:
    os.makedirs("{home}/.pip".format(home=os.environ['HOME']), exist_ok=True)
    with open("{home}/.pip/pip.conf".format(home=os.environ['HOME']), 'w') as f:
        f.write("[global]\r\nindex-url = https://mirrors.aliyun.com/pypi/simple\r\n")

if args.sources_list:
    RunCmd("mv /etc/apt/sources.list /etc/apt/sources.list.backup", True)
    RunCmd("cp sources_ubuntu18.04.list /etc/apt/sources.list", True)

if args.sources_list_debian10:
    RunCmd("mv /etc/apt/sources.list /etc/apt/sources.list.backup", True)
    RunCmd("cp sources_debian10.list /etc/apt/sources.list", True)

if args.develop_environment:
    RunCmd("apt update", True)
    RunCmd("apt install build-essential cmake python3-pip exuberant-ctags", True)
    RunCmd("apt autoremove", True)
    RunCmd("pip3 install ipython matplotlib", True)
