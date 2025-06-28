
#!/bin/bash

PROJECTS_DIR="$HOME/personal"  

cd "$PROJECTS_DIR" || exit 1
DIR=$(find . -maxdepth 1 -type d -not -name '.' | sed 's|^\./||' | fzf)

[ -z "$DIR" ] && exit

SESSION_NAME=$(basename "$DIR")
FULL_PATH="$PROJECTS_DIR/$DIR"

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    if [ -n "$TMUX" ]; then
        # Already inside tmux, switch client
        tmux switch-client -t "$SESSION_NAME"
    else
        # Not inside tmux, attach to the session
        tmux attach-session -t "$SESSION_NAME"
    fi
else
    if [ -n "$TMUX" ]; then
        tmux new-session -ds "$SESSION_NAME" -c "$FULL_PATH"
        tmux switch-client -t "$SESSION_NAME"
    else
        tmux new-session -s "$SESSION_NAME" -c "$FULL_PATH"
    fi
fi
