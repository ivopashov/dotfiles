eval "$(rbenv init -)"
alias gem-open='BUNDLER_EDITOR=code bundle open'
alias ..='cd ..'
alias ....='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'
alias g='git'
alias be='bundle exec'

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
