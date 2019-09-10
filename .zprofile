alias g='git'
alias cb="g bl | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'"

export EDITOR='vim'

function fb() {
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        branch=`git branch -vv | fzf | awk '{print $1}' | sed "s/.* //"`
        git checkout $branch
    else
        echo Not a git repo.
    fi
}

function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
