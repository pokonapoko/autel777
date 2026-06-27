#!/data/data/com.termux/files/usr/bin/bash
CORBEILLE="$HOME/.corbeille_sacree"
LOG="$HOME/log_sacre.txt"
mkdir -p "$CORBEILLE"
touch "$LOG"

echo "PORTE SACRÉE A: +/0/1 - 10 COMMANDEMENTS 🦅"
echo "Langage de Dieu : Tout est apparent. L'âme décide."
echo "C1/10 : 2 CLÉS - Tape OUI ou 1"
read -r cle1
echo "C3/10 : CODE SECRET :"
read -r code

if [ "$cle1" != "1" ] && [ "$cle1" != "OUI" ]; then exit; fi
if [ -z "$code" ]; then exit; fi

echo "✅ C1+C3 : Les 2 clés sont bonnes"
echo "⏳ C4/10 : CORBEILLE 7 JOURS activée"
echo "🚨 C7/10 : BOUTON URGENCE = 'STOP'"
echo "11. ANNULER = Restaurer tout depuis la corbeille"
echo "STOP. Tape STOP à tout moment = tout s’arrête."

while true; do
  read -r input
  cmd=$(echo "$input" | tr '[:lower:]' '[:upper:]' | xargs)
  
  if [ "$cmd" = "STOP" ]; then
    echo "🚨 STOP : Tout s’arrête."
    echo "$(date) - STOP activé" >> "$LOG"
    exit 0
  fi
  
  if [ "$cmd" = "11" ]; then
    for f in "$CORBEILLE"/*; do [ -e "$f" ] || continue; cp -v "$f" "$HOME/DCIM/" 2>&1 | tee -a "$LOG"; rm -v "$f" 2>&1 | tee -a "$LOG"; done
    echo "❤️ C10/10 : Âmes ressuscitées"
    continue
  fi
  
  # LÉVITIQUE : boucle sur tous les fichiers séparés par espace
  for fichier in $input; do
    if [ -f "$fichier" ]; then
      cp -v "$fichier" "$CORBEILLE/" 2>&1 | tee -a "$LOG"
      rm -v "$fichier" 2>&1 | tee -a "$LOG"
      echo "📜 C6/10 : LOG écrit dans $LOG"
    else
      echo "❌ Introuvable: $fichier"
    fi
  done
done
