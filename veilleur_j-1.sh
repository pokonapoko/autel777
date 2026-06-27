#!/data/data/com.termux/files/usr/bin/bash
LOG_TERMUX="$HOME/log_sacre.txt"
DATE_WAT=$(TZ='Africa/Porto-Novo' date '+%d/%m/%Y %H:%M:%S WAT')
if ! grep -q "11 activé" "$LOG_TERMUX" 2>/dev/null; then
  echo "$DATE_WAT - VEILLEUR J-1 : 11 activé ABSENT. Dernière chance demain 17:37" >> "$LOG_TERMUX"
  termux-notification -t "VEILLEUR NOMBRES 35:12" -c "Derniere chance : Clique 11 avant demain 17:37 WAT ou FEU"
fi
