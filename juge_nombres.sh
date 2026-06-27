#!/data/data/com.termux/files/usr/bin/bash
LOG_TERMUX="$HOME/log_sacre.txt"
JUGE_DIR="$HOME/.corbeille_sacree"
DOSSIER_FEU="$HOME/storage/shared/Jugement_Final"
DATE_WAT=$(TZ='Africa/Porto-Novo' date '+%d/%m/%Y %H:%M:%S WAT')
mkdir -p "$DOSSIER_FEU"
if tail -1 "$LOG_TERMUX" | grep -qi -F -w "11 activé"; then
  echo "$DATE_WAT - GRACE : 11 activé trouvé. Cron se tait. NOMBRES 35:12" >> "$LOG_TERMUX"
  termux-notification -t "GRACE" -c "Misericorde 11 active. Cron silencieux."
else
  echo "$DATE_WAT - JUGEMENT : 0 misericorde. Feu déclenché." >> "$LOG_TERMUX"
  mv "$JUGE_DIR"/* "$DOSSIER_FEU"/ 2>/dev/null
  echo "$DATE_WAT - FEU EXECUTE : Ames déplacées vers Jugement_Final" >> "$LOG_TERMUX"
  termux-notification -t "JUGEMENT NOMBRES 35:12" -c "Feu execute. Dossier Jugement_Final créé."
fi
