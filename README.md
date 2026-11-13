# tmux-agent-status-sidebar

A tmux sidebar for Claude Code and Codex sessions. Workspaces appear at the top. Agents appear below, ordered by status.

The sidebar reads Claude status from `claude agents --json --all`. It reads Codex status from the local Codex control socket. It does not install agent hooks. If the Codex socket is unavailable, Codex panes appear with `?` status.

## Requirements

- tmux 3.8
- [uv](https://docs.astral.sh/uv/)
- Claude Code with `claude agents --json --all`, Codex with a running control socket, or both

The script uses Python 3.10 or newer. On first use, uv downloads the pinned `websockets` package.

## Install

Add the plugin before the existing [TPM](https://github.com/tmux-plugins/tpm) line in `tmux.conf`:

```tmux
set -g @plugin 'angadsgrover/tmux-agent-status-sidebar'
```

Reload tmux, then press `prefix + I` to install the plugin.

Press `prefix + o` to open or close the sidebar. Use `Tab` to switch sections, `j` and `k` to move, `Enter` to open a row, and `q` to close it.

## Colors

The sidebar uses the terminal background. You can set four tmux options before the TPM line to change its status colors. Each value is a terminal color number from `0` to `255`.

```tmux
set -g @agent_sidebar_color_needs '1'   # Needs you; default red
set -g @agent_sidebar_color_working '3' # Working; default yellow
set -g @agent_sidebar_color_ready '6'   # Ready; default cyan
set -g @agent_sidebar_color_current '4' # Current row; default blue
```

Unspecified colors keep their defaults. The sidebar reads these options when it opens.
