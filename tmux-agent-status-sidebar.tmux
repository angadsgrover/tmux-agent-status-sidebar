#!/usr/bin/env bash

plugin_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sidebar_key="$(tmux show-option -gqv @agent_sidebar_key)"
sidebar_key="${sidebar_key:-o}"
old_key="$(tmux show-option -gqv @agent_sidebar_bound_key)"
if [[ -n "$old_key" && "$old_key" != "$sidebar_key" ]]; then
    tmux unbind-key "$old_key"
fi
tmux bind-key "$sidebar_key" run-shell -b "\"$plugin_dir/scripts/tmux-agent-status\" --toggle '#{pane_id}' --client '#{client_tty}'"
tmux set-option -g @agent_sidebar_bound_key "$sidebar_key"
