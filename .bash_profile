eval "$(rbenv init -)"
eval "$(pyenv init -)"
alias gem-open='BUNDLER_EDITOR=code bundle open'
alias ..='cd ..'
alias ll='ls -la'
alias g='git'
alias cb="g bl | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'"
alias be='bundle exec'
alias hook='./git-hooks/hm --install'
alias unhook='./git-hooks/hm --uninstall'
alias stagingreset='git fetch && git checkout staging && git reset --hard origin/staging'
alias bi='bundle install --path .bundle'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR='vim'

function gl() {
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        branch=`git branch -vv | fzf | awk '{print $1}' | sed "s/.* //"`
        git checkout $branch
    else
        echo Not a git repo.
    fi
}

delbr() {
    git branch -d "$1"
    git push origin :"$1"
}

source ~/.bin/tmuxinator.bash

shas() {
  g rev-list HEAD --max-count=$1 | tr "\n" " " | pbcopy
}

