#!/bin/bash
export EDITOR=vim
export PS1='RatoX:\W$ '
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

alias st='git status'
alias g='git'

alias codigos='cd $HOME/codigos/'
alias up="python -m SimpleHTTPServer"
alias mongod="mongod --dbpath ~/db"
alias ctags='$(brew --prefix)/bin/ctags -R .'
alias ravim="vim"
alias my-diff="git --no-pager  diff HEAD..master --stat"
alias be="bundle exec"

# Yes, I use mutt
alias mutt="torify mutt 2>/dev/null"

# This function is a find/replace in all documents
# e.g: replace rodrigo r_o_d_r_i_g_o
# all files with the string rodrigo will be replaced
function replace {
  ag -0 -l "$1" | xargs -0 sed -i "" -E "s/$1/$2/g"
}

# TMUX
# https://gist.github.com/febrianrendak/9578240
function tmux_web {
 SESSION_NAME=$1
 tmux new -s "$SESSION_NAME" -n editor -d
 tmux send-keys -t "$SESSION_NAME" 'vim .' C-m
 tmux new-window -n console -t "$SESSION_NAME"

 tmux split-window -v -t "$SESSION_NAME:2"
 tmux send-keys -t "$SESSION_NAME:2.1" C-m
 tmux send-keys -t "$SESSION_NAME:2.2" C-m

 tmux attach -t "$SESSION_NAME:1"
}

# This function will open two panels, the first one with VIM on the current directory 
# and the second one with two Terminal opens
function t {
  DIR_NAME=${PWD##*/}

  echo "Trying to create new Tmux session with name '$DIR_NAME'."
  tmux has-session -t "$DIR_NAME" 2>/dev/null
  if [ $? -eq 1 ]
  then
    echo "Session not found. Create Session '$DIR_NAME'."
    tmux_web "$DIR_NAME"
  else
    #random string as new session suffix
    RAND_NUMB=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 2 | head -n 1)
    echo "Session found. Create session with name '$DIR_NAME$RAND_NUMB'"
    tmux_web "$DIR_NAME$RAND_NUMB"
  fi

  echo "Start tmux session $DIR_NAME."
}

# Enable vi-mode on bash when press ESC
set -o vi
