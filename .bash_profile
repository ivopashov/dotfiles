alias ..='cd ..'
alias ll='ls -la'
alias g='git'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
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

function db() {
    git branch -d "$1"
    git push origin :"$1"
}

function shas() {
  g rev-list HEAD --max-count=$1 | tr "\n" " " | pbcopy
}

