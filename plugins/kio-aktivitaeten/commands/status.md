---
description: Fortschritts-Überblick — Aktivitäten erfasst, analysiert, Vorschläge offen, Bausteine erstellt
argument-hint: ""
allowed-tools: ["Read"]
---

# /status

> Wenn du unbekannte Platzhalter siehst oder prüfen möchtest welche Tools verbunden sind, schau in [CONNECTORS.md](../CONNECTORS.md).

Zeige deinen Fortschritt in der Aktivitäten-Journey: Wie viele Aktivitäten erfasst, wie viele analysiert, wie viele Vorschläge offen, wie viele Bausteine bereits umgesetzt.

## Verwendung

```
/status
```

---

## Wie es funktioniert

```
┌─────────────────────────────────────────────────────────────────┐
│                          /status                                 │
├─────────────────────────────────────────────────────────────────┤
│  STANDALONE (funktioniert immer)                                 │
│  ✓ Liest context/profil.json, aktivitaeten.json, analyse.json   │
│  ✓ Liest context/vorschlaege.json und context/bausteine.json    │
│  ✓ Zeigt Journey-Fortschritt mit klaren nächsten Schritten      │
│  ✓ Zeigt Zeitersparnis-Bilanz der umgesetzten Bausteine         │
├─────────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (wenn Tools verbunden sind)                        │
│  + ~~project-tracker: Synchronisiert Bausteine als Aufgaben     │
│  + Fortschritt im Projekt-Tool sichtbar machen                  │
│  + Offene Bausteine als Aufgaben anlegen                        │
└─────────────────────────────────────────────────────────────────┘
```

---

## Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Aktivitäten-Journey Status
  Max Mustermann · Teamleiter Operations
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Inventur
   14 Aktivitäten erfasst
   Letzte Session: 2026-02-20

📊 Analyse
   14 Aktivitäten analysiert
   Automatisierungspotenzial: 6 Aktivitäten (43%)
   Geschätztes Sparpotenzial: 11h/Woche

💡 Vorschläge
   5 Vorschläge generiert
   Offen:     3 (Wochenbericht, CRM-Datenpflege, E-Mail-Routing)
   In Arbeit: 1 (Status-Update ↗ Baustein erstellt)
   Umgesetzt: 1 (Meeting-Protokoll ✅)

⚡ Bausteine
   2 Bausteine erstellt
   Umgesetzt:  1 (Meeting-Protokoll — spart 1h/Woche)
   Bereit:     1 (Status-Update — wartet auf Setup)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⏱️ Zeitersparnis (bereits umgesetzt)
   Meeting-Protokoll:  1h/Woche (seit 2026-02-15)
   Gesamt:             1h/Woche = 52h/Jahr

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Nächster Schritt:
→ /baustein Status-Update  (bereit, spart 5h/Woche)
```

---

## Status bei leerem Kontext

Wenn noch keine Daten vorhanden sind:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Aktivitäten-Journey Status
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Noch kein Profil angelegt.

So geht's los:

1. /start  — Profil anlegen (2 Min)
2. /inventur  — Aktivitäten erfassen (~30 Min)
3. /analyse  — Auswertung ansehen
4. /vorschlaege  — Top-Automatisierungen entdecken
5. /baustein  — Ersten Baustein erstellen
```

---

## Wenn Tools verbunden sind

**~~project-tracker verbunden:**
- Offene Bausteine werden als Aufgaben in deinem Tool angelegt
- Status-Sync: Abgehakte Aufgaben werden als "umgesetzt" markiert
- Teamweite Sichtbarkeit des Automatisierungsfortschritts

---

## Tipps

1. **Regelmäßig checken** — `/status` gibt dir einen schnellen Überblick wo du stehst.
2. **Einen Baustein nach dem anderen** — Der Status zeigt immer den besten nächsten Schritt.
3. **Zeitersparnis tracken** — Motivation steigt wenn man sieht was man schon erreicht hat.
