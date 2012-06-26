PROMPT_DIRTRIM=4
function align {
  printf "%$1u" $2
}
function file_count {
  find . -maxdepth 1 -type f | wc -l
}
function folder_count {
  find . -maxdepth 1 -type d | tail -n +2 | wc -l
}
function folder_size {
  ls -lah | head -1 | sed 's:total ::'
}
function folder_info {
  info="$(folder_size) $(align 5 $(folder_count))📁 $(align ${#HISTSIZE} $(file_count))📄 "
  r=''; c=$(($COLUMNS - ${#info} - 11))
  for v in "$@"; do c=$(($c - ${#v})); done
  [[ $c -gt ${#info} ]] && echo -en "\e[${c}C${info}" || echo ''
}
function last_result {
  s=$?; r=╭; c=$(($COLUMNS - ${#HISTSIZE} - ${#s} - 14))
  for ((i=1; i<=$c; i++)); do r="$r─"; done
  echo -en "$r┤\e[0;3$([[ $s = '0' ]] && echo '2m😎 0' || echo '1m😕 '$s)"
}

PS1="\[\e[m\]\$(last_result) \A⌚ \$(align ${#HISTSIZE} \!)👆
\[\e[m\]│\[\e[1;30m\]👤 \u 💻 \h:\l \[\e[1;34m\]📂 \w \[\e[0;34m\]\
\$(folder_info \u \h \l \$(echo \w | sed 's:$HOME:~:'))
\[\e[m\]│\[\e[0;35m\]\j⌛ \#👈 \[\e[1;35m\]\\$ \[\e[0m\]\[\e]2;\u@\H \w\a"

