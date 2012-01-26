# Git tab completion
source ~/git-completion.bash

function _git_color() {
  `git branch > /dev/null 2>&1`; if [ $? -eq 0 ]; then
    clean=`git status | grep "nothing to commit" | wc -l`
    if [ "$clean" -eq "1" ]; then
      echo '\e[0;32m'; else # clean working directory
      stagged=`git status | grep "not staged for commit" | wc -l`
      if [ "$stagged" -eq "1" ]; then
        echo '\e[1;31m'; else # unstagged changes
        echo '\e[1;33m'; # all changes stagged
      fi;
    fi;
  fi;
}

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1 2>/dev/null`
    if $lastcommit ; then
      seconds_since_last_commit=$((now-last_commit))
      minutes_since_last_commit=$((seconds_since_last_commit/60))
      echo $minutes_since_last_commit
    else
      echo "-1"
    fi
}

# Show branch in status line
PS1='[\w$(__git_ps1 " (`_git_color``minutes_since_last_commit`|%s\e[00m)")]\$ '

#PS1="\u$ \w: "
alias ll="ls -lahG"
alias b="bundle exec"

# Annotate gem overiding defaults with my prefered options
alias annotate="annotate -p before -e tests"

# Git shortcuts
alias gs="git status"
alias gpo="git pull --rebase origin master"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session. 

export PATH="/usr/local/bin:$PATH" # For Homebrew
export PATH="/Applications/MAMP/bin/php/php5.2.17/bin/:$PATH"
#export PATH="/Applications/MAMP/bin/php/php5.3.6/bin/:$PATH"
export PATH="./cake/console/:$PATH"

export GREP_OPTIONS="--exclude=*\.svn*"