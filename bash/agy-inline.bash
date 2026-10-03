# Antigravity inline bash command generator (Ctrl+G)
_agy_inline_cmd() {
  local query="$READLINE_LINE"
  [[ -z "$query" ]] && return

  local model="${AGY_INLINE_MODEL:-gemini-3.8-flash-low}"

  # Animated working indicator matching the interactive TUI
  local spinner_pid
  _spin() {
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    local i=0
    while true; do
      printf "\r\033[K\033[36m%s\033[0m Working..." "${chars:i++%10:1}" > /dev/tty
      sleep 0.08
    done
  }
  { _spin & } 2>/dev/null
  spinner_pid=$!

  # Clean up spinner on cancel (Ctrl+C)
  trap 'kill "$spinner_pid" 2>/dev/null; printf "\r\033[K" > /dev/tty' INT

  local generated
  generated=$(agy --model "$model" -p "Provide ONLY the raw single-line bash command without markdown code blocks, backticks, or commentary for: $query" 2>/dev/null \
    | sed -E 's/^```[a-z]*//; s/```$//; s/^`//; s/`$//' \
    | head -n 1 \
    | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

  # Stop spinner and erase the status line
  kill "$spinner_pid" 2>/dev/null
  wait "$spinner_pid" 2>/dev/null
  trap - INT
  printf "\r\033[K" > /dev/tty

  if [[ -n "$generated" ]]; then
    READLINE_LINE="$generated"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
bind -x '"\C-g": _agy_inline_cmd'
