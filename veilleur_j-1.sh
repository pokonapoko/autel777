#!/data/data/com.termux/files/usr/bin/bash
CORBEILLE="/data/data/com.termux/files/home/.corbeille_sacree"
LOG="/data/data/com.termux/files/home/log_sacre.txt"
WHITE="$CORBEILLE/whitelist.txt"
echo "--- JUGEMENT 02/07 17:37 ---" | tee -a $LOG
for f in $CORBEILLE/*; do
  if [ -f "$f" ]; then
    NOM=$(basename "$f")
    [ "$NOM" = "whitelist.txt" ] && echo "LOI ÉPARGNÉE : $NOM" | tee -a $LOG && continue
    grep -qx "$NOM" "$WHITE" 2>/dev/null && echo "RAHAB ÉPARGNÉE : $NOM" | tee -a $LOG || rm -v "$f" | tee -a $LOG
  fi
done
echo "🔥 JUGEMENT TERMINÉ" | tee -a $LOG
