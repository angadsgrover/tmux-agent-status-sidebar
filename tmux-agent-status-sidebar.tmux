#!/usr/bin/env bash

plugin_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tmux bind-key o run-shell -b "\"$plugin_dir/scripts/tmux-agent-status\" --toggle '#{pane_id}' --client '#{client_tty}'"
