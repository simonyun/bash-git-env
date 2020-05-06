#!/usr/bin/env bash

source "${BASH_GIT_ENV_HOME}/gitconfig.sh"

# snazzy command prompt munging
# $ brew install bash-completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion"
fi

if [ -f "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='[\h \[\033[0;36m\]\w\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '
else
  export PS1='[\h \[\033[0;36m\]\w\[\033[0m\]]\$ '
fi

# Bazel Bash completion
if [ -f "${HOME}/.bazel/bin/bazel-complete.bash" ]; then
  source "${HOME}/.bazel/bin/bazel-complete.bash"
fi

# Bash history
shopt -s histappend
HISTFILESIZE=10000
HISTSIZE=5000

# Silence default zsh warning: https://support.apple.com/en-us/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

# environment variables
export GOPATH="${HOME}/w/go" # $ brew install go for this to be relevant
export GOBIN="${GOPATH}/bin"
PYBIN="$(python -m site --user-base)/bin"
export PATH="${PATH}:${GOBIN}:${PYBIN}"
export EDITOR='emacs'
export GREP_OPTIONS="--color=auto"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8*)
export JDK7_HOME="/Library/Java/JavaVirtualMachines/zulu-7.jdk/Contents/Home"
export ANDROID_HOME="/usr/local/share/android-sdk"

# python2 virtualenv ACTIVATE
# VIRTUALENV_DEFAULT_BIN="${HOME}/w/virtualenv/default/bin"
# source "${VIRTUALENV_DEFAULT_BIN}/activate"

# python3 venv activate
VENV_DEFAULT_BIN="${HOME}/w/venv/bin"
source "${VENV_DEFAULT_BIN}/activate"

# shell stuff
alias ls="ls -FG"
alias ll='ls -FGl'
alias la='ls -FGla'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias env='env | sort'

# directories
alias ws='cd ~/w'
alias bge='cd ~/w/bash-git-env'

# git
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gb='git branch'
alias gm="git merge --no-ff"
alias gmd='git merge --no-ff develop'
alias gmm='git merge --no-ff master'
alias gp='time git pull -vvv'
alias gpssu='git pull -vvv && git submodule sync && git submodule update'
alias gssu='git submodule sync && git submodule update'
alias gps='git pull -vvv && git submodule sync && git submodule update'
alias gct='git commit'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gcl='git checkout -'
alias gco='git checkout'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gl='git log'
alias glp='git log -p'
alias gh='git hist'
alias gss='git stash save'
alias gsp='git stash pop'
alias gffs='git flow feature start'
alias gffp='git flow feature publish'
alias gffsp='git_flow_feature_start_publish'
alias gfff='git flow feature finish'
alias gfft='git flow feature track'
alias gcf='git_flow_checkout_feature'
alias gfhs='git flow hotfix start'
alias gfhp='git flow hotfix publish'
alias gfhsp='git_flow_hotfix_start_publish'
alias gfhf='git flow hotfix finish'
alias gfht='git flow hotfix track'
alias gch='git_flow_checkout_hotfix'
alias grpo='git remote prune origin'
alias gfmm='git fetch origin master && git merge --no-ff origin/master'

# bazel
alias bb='bazel build'
alias bt='bazel test'
alias bba='bazel build //...'
alias bta='bazel test //...'

# fast git autocomplete
for cmd in git gco gm gb; do
  complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" ${cmd}
done

# functions
function git_flow_feature_start_publish {
  git flow feature start $1 && git flow feature publish $1
}

function git_flow_checkout_feature {
  git checkout feature/$1
}

function git_flow_hotfix_start_publish {
  git flow hotfix start $1 && git flow hotfix publish $1
}

function git_flow_checkout_hotfix {
  git checkout hotfix/$1
}

function title {
  # http://askubuntu.com/questions/22413/how-to-change-gnome-terminal-title
  echo -ne "\033]0;$1\007"
}
