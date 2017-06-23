eval "$(rbenv init -)"
eval "$(pyenv init -)"
alias gem-open='BUNDLER_EDITOR=code bundle open'
alias ..='cd ..'
alias ....='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'
alias g='git'
alias cb="g bl | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'"
alias be='bundle exec'
alias cas='ssh rbank@10.11.1.50'
alias cap1='ssh rbank@10.20.11.159'
alias cap2='ssh rbank@10.20.1.43'
alias cras='ssh rbank@10.11.1.105'
alias cms='ssh rbank@web2-staging.rbank-int.com'
alias hook='./git-hooks/hm --install'
alias unhook='./git-hooks/hm --uninstall'
alias jump='ssh ipashov@jump.rbank-int.com'
alias cadevdb='psql -d auto_categorization_development'
alias stagingreset='git fetch && git checkout staging && git reset --hard origin/staging'
alias masterreset='git fetch && git checkout master  && git reset --hard origin/master'
alias fpushstaging='git push origin +master:staging && g co staging && g reset --hard origin/staging'
alias bi='bundle install --path .bundle'
# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export JAVA_HOME=$(/usr/libexec/java_home)

function gl() {
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        branch=`git branch -vv | fzf | awk '{print $1}' | sed "s/.* //"`
        git checkout $branch
    else
        echo Not a git repo.
    fi
}

grep-in-project () {
    git --no-pager grep "$@"
    grep -RI "$@" `bundle show --paths`
}

delbr() {
    # do things with parameters like $1 such as
    git branch -d "$1"
    git push origin :"$1"
}
