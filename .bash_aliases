PROMPT_DIRTRIM=4
function align {
  printf "%${2:-${#HISTSIZE}}u" $1
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
  info="$(folder_size) $(align $(folder_count) 5)📁 $(align $(file_count))📄 "
  r=''; i=${#info}; c=$(($COLUMNS - 11))
  for v in "$@"; do c=$(($c - ${#v})); done
  [[ $c -gt $i ]] && echo -en "\e[$(($c - $i))C${info}" || echo ''
}
function last_result {
  s=$?; r=╭; c=$(($COLUMNS - ${#HISTSIZE} - ${#s} - 15))
  for ((i=1; i<=$c; i++)); do r="$r─"; done
  echo -en "$r┤\e[0;3$([[ $s = '0' ]] && echo '2m😎 0' || echo '1m😕 '$s)"
}
function clock {
  h=$(echo "obase=16;ibase=10; ${1:0:2} - 1" | bc)
  m=$([[ $((10#${1:3:2})) -gt 29 ]] && echo C || echo 0)
  c=$(echo "obase=16;ibase=16; F09F9590 + $h + $m" | bc)
  s=$([[ $2 = 'PM' ]] && echo ☼ || echo ☾)
  echo -en "$s$1\x${c:0:2}\x${c:2:2}\x${c:4:2}\x${c:6:2}"
}
PS1="\[\e[m\]\$(last_result) \[\e[1;30m\]\$(clock \@ \A) \$(align \!)👆 
\[\e[m\]│\[\e[1;30m\]👤 \u 💻 \h:\l \[\e[1;34m\]📂 \w \[\e[0;30m\]\
\$(folder_info \u \h \l \$(echo \w | sed 's:$HOME:~:'))
\[\e[m\]│\[\e[1;34m\]\j⌛ \#👈  \\$ \[\e[0m\]\[\e]2;\u@\H \w\a"

