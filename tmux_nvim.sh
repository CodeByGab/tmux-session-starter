#!/bin/bash

SESSION_NAME="dev"
WORKDIR="$(pwd)"

tmux new-session -d -s "$SESSION_NAME" -c "$WORKDIR"

# Painel 0: nvim
tmux send-keys -t "$SESSION_NAME":0 'nvim' C-m

# tmux send-keys -t 0.0 C-n

# Painel 1: npm run dev 
tmux split-window -v -t "$SESSION_NAME":0 -c "$WORKDIR"

tmux send-keys -t "$SESSION_NAME":0.1 'npm run dev -- --host' C-m

# Painel 2: Git
tmux split-window -h -t "$SESSION_NAME":0.1 -c "$WORKDIR"

tmux resize-pane -D -t "$SESSION_NAME":0.0 14

tmux select-pane -t "$SESSION_NAME":0.0

tmux attach-session -t "$SESSION_NAME"

