#!/bin/bash

SESSION_NAME="dev"
WORKDIR="$(pwd)"

tmux new-session -d -s "$SESSION_NAME" -c "$WORKDIR"

# Painel 0: nvim
tmux send-keys -t "$SESSION_NAME":0 'nvim' C-m

# Painel 1: lado direito 
tmux split-window -h -t "$SESSION_NAME":0 -c "$WORKDIR"

# Painel 2: abaixo do painel da direita
tmux split-window -v -t "$SESSION_NAME":0.1 -c "$WORKDIR"

tmux resize-pane -R -t "$SESSION_NAME":0.0 40

tmux select-pane -t "$SESSION_NAME":0.0

tmux attach-session -t "$SESSION_NAME"
