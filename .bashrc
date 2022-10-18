#show the current git branch 
find_git_branch () {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head = ref:\ refs/heads/* ]]; then
                git_branch="(*${head#*/*/})"
            elif [[ $head != '' ]]; then
                git_branch="(*(detached))"
            else
                git_branch="(*(unknow))"
            fi  
            return
        fi  
        dir="../$dir"
    done
    git_branch=''
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
PS1="\u@\h:\w\[\033[0;32m\]\$git_branch\[\033[0m\] \$ "

# demangler for c++ debug
function demangle(){
    python3 -c "import sys;import demangler;print(demangler.demangle(sys.argv[1]))" $@
}

function set_proxy {
    # export http_proxy=http://username:password@proxyserver.net:port/
    # export ftp_proxy=http://username:password@proxyserver.netport/
    export http_proxy=http://127.0.0.1:8889
    export https_proxy=http://127.0.0.1:8889
    echo "set http_proxy=http://127.0.0.1:8889 and  https_proxy=http://127.0.0.1:8889"
}

function unset_proxy {
    # export http_proxy=http://username:password@proxyserver.net:port/
    # export ftp_proxy=http://username:password@proxyserver.netport/
    export http_proxy=
    export https_proxy=
    echo "unset http_proxy and https_proxy"
}
