PROMPT_DIRTRIM=4
PS1="
\[\e[0;3\$(s=\$?; [[ \$s = '0' ]] && echo '2m\]😎 '\$s || echo '1m\]😕 '\$s) \
\[\e[1;30m\]👤 \u 💻 \h:\l \[\e[0;34m\]📂 \w \
\$(find . -maxdepth 1 -type d | tail -n +2 | wc -l)📁 \
\$(find . -maxdepth 1 -type f | wc -l)📄 \$(ls -lah | head -1 | sed 's:total ::') 
\[\e[0;35m\]\A⌚ \j⌛ \!👆 \#👈 \\$ \[\e[0m\]"

