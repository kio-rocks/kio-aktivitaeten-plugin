#!/usr/bin/env bash
# load-context.sh
# Wird bei jedem Session-Start ausgeführt.
# Lädt Profil und Fortschritt und gibt eine Kontext-Zusammenfassung aus.

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(realpath "$0")")")}"
CONTEXT_DIR="$PLUGIN_ROOT/context"
PROFIL_FILE="$CONTEXT_DIR/profil.json"
AKTIVITAETEN_FILE="$CONTEXT_DIR/aktivitaeten.json"

# Profil laden
if [ -f "$PROFIL_FILE" ]; then
  NAME=$(python3 -c "import json,sys; d=json.load(open('$PROFIL_FILE')); print(d.get('name','Unbekannt'))" 2>/dev/null || echo "Unbekannt")
  ROLLE=$(python3 -c "import json,sys; d=json.load(open('$PROFIL_FILE')); print(d.get('rolle',''))" 2>/dev/null || echo "")
  echo "=== KIO Aktivitäten-Plugin ==="
  echo "Willkommen zurück, $NAME ($ROLLE)"
else
  echo "=== KIO Aktivitäten-Plugin ==="
  echo "Kein Profil gefunden. Starte mit /start um dein Profil anzulegen."
  cat "$PLUGIN_ROOT/context/welcome.md" 2>/dev/null
  exit 0
fi

# Aktivitäten-Fortschritt laden
if [ -f "$AKTIVITAETEN_FILE" ]; then
  ANZAHL=$(python3 -c "import json,sys; d=json.load(open('$AKTIVITAETEN_FILE')); print(len(d.get('aktivitaeten', [])))" 2>/dev/null || echo "0")
  ANALYSIERT=$(python3 -c "import json,sys; d=json.load(open('$AKTIVITAETEN_FILE')); print(d.get('meta',{}).get('analysiert', False))" 2>/dev/null || echo "False")

  echo ""
  echo "Fortschritt:"
  echo "  - $ANZAHL Aktivitäten erfasst"
  if [ "$ANALYSIERT" = "True" ]; then
    echo "  - Analyse vorhanden"
  else
    echo "  - Noch keine Analyse (starte mit /analyse)"
  fi
else
  echo ""
  echo "Noch keine Aktivitäten erfasst. Starte mit /inventur für eine geführte Session."
fi

echo ""
echo "Commands: /start /inventur /analyse /vorschlaege /baustein /status"
