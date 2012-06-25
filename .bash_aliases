PROMPT_DIRTRIM=4
PS1="
\[\033[3\$(s=\$?; [[ \$s = '0' ]] && echo '2m\]😎 '\$s || echo '1m\]😕 '\$s) \
\[\033[1;30m\]👤 \u 💻 \h:\l \[\033[0;34m\]📂 \w \
\$(find . -maxdepth 1 -type d | tail -n +2 | wc -l)📁 \
\$(find . -maxdepth 1 -type f | wc -l)📄 \$(ls -lah | head -1 | sed 's:total ::') 
\[\033[0;35m\]\A⌚ \j⌛ \!👆 \#👈 \\$ \[\033[0m\]"

