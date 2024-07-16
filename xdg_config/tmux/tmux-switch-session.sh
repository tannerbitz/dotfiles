#!/usr/bin/env zsh

tmuxsessions=$(tmux list-sessions -F "#{session_name}")

tmux_switch_to_session() {
    session="$1"
    if [[ $tmuxsessions = *"$session"* ]]; then
        if [[ -n "$TMUX" ]]; then
            tmux switch-client -t "$session"
        else
            tmux attach-session -t "$session"
        fi
    fi
}

choice=$(sort -rfu <<< "$tmuxsessions" \
    | fzf-tmux \
    | tr -d '\n')
tmux_switch_to_session "$choice"
