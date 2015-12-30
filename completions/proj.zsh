if [[ ! -o interactive ]]; then
    return
fi

compctl -K _proj proj

_proj() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(proj commands)"
  else
    completions="$(proj completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
