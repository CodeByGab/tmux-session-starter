#!/bin/bash

SESH="acervo"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESH -n "nvim"

  tmux send-keys -t $SESH:nvim "cd ~/projects/AcervoUI" C-m
  tmux send-keys -t $SESH:nvim "nvim" C-m

  tmux new-window -t $SESH -n "server"
  tmux send-keys -t $SESH:server "cd ~/projects/AcervoUI" C-m
  tmux send-keys -t $SESH:server "npm run dev -- --host" C-m

  tmux new-window -t $SESH -n "git"
  tmux send-keys -t $SESH:git "cd ~/projects/AcervoUI" C-m
  tmux send-keys -t $SESH:git "lazygit" C-m

  tmux select-window -t $SESH:nvim
fi

tmux attach-session -t $SESH 
