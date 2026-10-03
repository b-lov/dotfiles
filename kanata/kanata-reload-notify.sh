#!/usr/bin/env bash
set -u

# Watch kanata.service journal logs for live reload events
journalctl --user -u kanata.service -f -n 0 --output=cat | while IFS= read -r line; do
  if [[ "$line" == *"Live reload successful"* ]]; then
    notify-send -a "Kanata" -i input-keyboard \
      "Kanata Reload" "Konfiguration erfolgreich neu geladen! ✓"
  elif [[ "$line" == *"live reload failed"* ]]; then
    err_hint=$(journalctl --user -u kanata.service -n 20 --output=cat | grep -E "help: Unknown|Error in configuration" | head -n 1 | sed 's/^[[:space:]]*//' || true)
    if [[ -n "$err_hint" ]]; then
      msg="Fehler: $err_hint"
    else
      msg="Konfigurationsdatei konnte nicht geparst werden!"
    fi
    notify-send -a "Kanata" -u critical -i dialog-error \
      "Kanata Reload fehlgeschlagen! ✗" "$msg"
  fi
done
