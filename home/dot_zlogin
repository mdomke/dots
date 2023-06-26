# Compile the completion dump to increase startup speed.
{
  if [[ -e "${ZGEN_DIR}/zcompdump" ]];
  then
    zcompdump="${ZGEN_DIR}/zcompdump"
  else
    zcompdump="${HOME}/.zcompdump"
  fi
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
