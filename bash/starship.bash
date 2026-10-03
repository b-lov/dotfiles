# Zeilenumbruch vor jedem Prompt, außer beim allerersten Start oder nach 'clear'
_starship_precmd_newline() {
  if [[ -z "${_FIRST_PROMPT:-}" ]]; then
    _FIRST_PROMPT=1
  else
    printf "\n"
  fi
}
starship_precmd_user_func="_starship_precmd_newline"

clear() {
  _FIRST_PROMPT=
  command clear "$@"
}
