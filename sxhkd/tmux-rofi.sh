#!/bin/sh
set -eu

sessions="$(tmux list-sessions -F '#S' 2>/dev/null || true)"

rofi_pick_session() {
  if command -v rofi >/dev/null 2>&1; then
    rofi -dmenu -i -p 'tmux session:' -lines 10 \
         -kb-row-down "Down,Control+n,j" -kb-row-up "Up,Control+p,k"
  else
    dmenu -i -vi -c -bw 3 -l 10 -h 30 -F -p 'tmux session:'
  fi
}

chosen="$(printf '%s\n' "$sessions" | rofi_pick_session)"

[ -n "$chosen" ] || exit 0

# crear sesión si no existe
if ! tmux has-session -t "$chosen" 2>/dev/null; then
  tmux new-session -ds "$chosen"
fi

if [ "${TMUX-}" ]; then
  exec tmux switch-client -t "$chosen"
fi

client_tty="$(
  tmux list-clients -F '#{client_tty} #{client_termname}' 2>/dev/null \
  | awk '$2 ~ /^st/ { print $1; exit }' || true
)"

if [ -n "${client_tty}" ]; then
  tmux switch-client -c "$client_tty" -t "$chosen"
  exit 0
fi

terminal="${TERMINAL:-$(command -v alacritty || command -v kitty || command -v xterm)}"
exec "$terminal" -e tmux attach -t "$chosen"

