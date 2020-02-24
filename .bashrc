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
