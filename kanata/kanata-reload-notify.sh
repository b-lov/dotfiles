#!/usr/bin/env bash
set -u

# Streamt neue Kanata-Logs in Echtzeit (ohne Header/Prefix)
journalctl --user -u kanata.service -f -n 0 --output=cat | while IFS= read -r line; do
  # ANSI-Farbcodes aus der Zeile entfernen
  clean_line=$(printf '%s\n' "$line" | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g")

  if [[ "$clean_line" == *"Live reload successful"* ]]; then
    notify-send -a "Kanata" -i input-keyboard \
      "Kanata Reload" "Konfiguration erfolgreich neu geladen! ✓"

  elif [[ "$clean_line" == *"live reload failed"* ]]; then
    # Letzte Logzeilen holen und ebenfalls von Farbcodes bereinigen
    raw_logs=$(journalctl --user -u kanata.service -n 25 --output=cat)
    clean_logs=$(printf '%s\n' "$raw_logs" | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g")

    # Zeilennummer und Fehlerursache per Regex (Lookbehind) aus den Logs extrahieren
    line_num=$(printf '%s\n' "$clean_logs" | grep -oP '(?<=kanata\.kbd:)\d+' | head -n 1 || true)
    help_txt=$(printf '%s\n' "$clean_logs" | grep -oP '(?<=help: ).+' | head -n 1 || true)

    if [[ -n "$line_num" && -n "$help_txt" ]]; then
      msg="Zeile $line_num: $help_txt"
    elif [[ -n "$help_txt" ]]; then
      msg="$help_txt"
    elif [[ -n "$line_num" ]]; then
      msg="Syntaxfehler in Zeile $line_num"
    else
      msg="Konfigurationsdatei konnte nicht geparst werden!"
    fi

    notify-send -a "Kanata" -u critical -i dialog-error \
      "Kanata Reload fehlgeschlagen! ✗" "$msg"
  fi
done
