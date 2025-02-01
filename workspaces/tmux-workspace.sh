#!/bin/bash

WORKSPACE_DIR="$HOME/.termux_tmux_workspaces"
mkdir -p "$WORKSPACE_DIR"

case $1 in
    save)
        tmux save-session -t "$2" -f "$WORKSPACE_DIR/$2.tmux"
        echo "Saved workspace: $2"
        ;;
    open)
        if [ -f "$WORKSPACE_DIR/$2.tmux" ]; then
            tmux start-server
            tmux source-file "$WORKSPACE_DIR/$2.tmux"
            echo "Opened workspace: $2"
        else
            echo "No workspace found with the name: $2"
        fi
        ;;
    list)
        echo "Available workspaces:"
        ls "$WORKSPACE_DIR" | sed 's/\.tmux$//'
        ;;
    delete)
        rm "$WORKSPACE_DIR/$2.tmux"
        echo "Deleted workspace: $2"
        ;;
    *)
        echo "Usage: $0 {save|open|list|delete} workspace_name"
        ;;
esac

