---
description: Geführte 30-Minuten Aktivitäts-Inventur — erfasse alle relevanten Team-Aktivitäten im Dialog
argument-hint: "<optionaler Fokus-Bereich>"
allowed-tools: ["Read", "Write", "Task"]
---

# /inventur

> Wenn du unbekannte Platzhalter siehst oder prüfen möchtest welche Tools verbunden sind, schau in [CONNECTORS.md](../CONNECTORS.md).

Starte eine geführte Aktivitäts-Inventur. Der `inventur-coach` Agent führt dich in ~30 Minuten durch eine strukturierte Erfassung aller Team-Aktivitäten.

## Verwendung

```
/inventur
```

Oder mit Fokus auf einen bestimmten Bereich:

```
/inventur Kundenservice
```

---

## Wie es funktioniert

```
┌─────────────────────────────────────────────────────────────────┐
│                        /inventur                                 │
├─────────────────────────────────────────────────────────────────┤
│  STANDALONE (funktioniert immer)                                 │
│  ✓ Delegiert an inventur-coach Agent                            │
│  ✓ Geführter Dialog in 4 Phasen (~30 Min)                      │
│  ✓ Warm-up → Freie Erfassung → Strukturierung → Zusammenfassung │
│  ✓ Ergebnis in context/aktivitaeten.json                        │
├─────────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (wenn Tools verbunden sind)                        │
│  + ~~calendar: Liest vergangene Termine als Aktivitäts-Basis    │
│  + ~~chat: Leitet Aktivitäten aus Team-Gesprächen ab            │
│  + Aktivitäten werden automatisch vorgeschlagen, du bestätigst  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Die 4 Phasen

### Phase 1: Warm-up (2 Min)
Der Agent beginnt locker: "Erzähl mir mal — womit hast du heute Morgen angefangen?"

Kein Druck, kein Formular. Einfach erzählen was kommt.

### Phase 2: Freie Erfassung (15 Min)
Du nennst Aktivitäten in natürlicher Sprache, der Agent hört zu und stellt gezielte Rückfragen:
- "Was noch? Was machst du regelmäßig das du noch nicht erwähnt hast?"
- "Gibt es Dinge die du erledigst obwohl du eigentlich keine Zeit dafür hast?"
- "Was würde liegenbleiben wenn du eine Woche krank wärst?"

### Phase 3: Strukturierung (8 Min)
Für jede erfasste Aktivität fragt der Agent kurz nach:
- **Status**: Läuft gut / kostet Energie / macht Spaß
- **Zeit**: Wie viele Minuten/Stunden pro Woche?
- **Frequenz**: Täglich / wöchentlich / monatlich / selten
- **Wert**: Hoch (direkt nützlich) / Mittel / Niedrig (Pflicht aber wenig Mehrwert)

### Phase 4: Zusammenfassung (5 Min)
Der Agent zeigt eine Tabelle aller erfassten Aktivitäten zur Bestätigung. Du kannst ergänzen, korrigieren oder direkt bestätigen.

---

## Ergebnis

Nach der Session schreibt der inventur-coach `context/aktivitaeten.json`:

```json
[
  {
    "id": "akt-001",
    "name": "Wochenbericht erstellen",
    "status": "kostet-energie",
    "energie": "negativ",
    "zeit_minuten": 90,
    "frequenz": "wöchentlich",
    "wert": "mittel",
    "quadrant": "automatisieren",
    "systeme": ["Excel", "Outlook"],
    "notizen": "Daten aus 3 Quellen zusammensuchen, dann formatieren"
  }
]
```

Und zeigt eine Zusammenfassung:

```
✅ Inventur abgeschlossen

Erfasst: 14 Aktivitäten
Quadranten:
  ⚡ Automatisieren:  6 (z.B. Wochenbericht, Meeting-Protokolle)
  🚀 Optimieren:      4 (z.B. Angebote erstellen)
  ✅ Behalten:        3 (z.B. Kundengespräche)
  ❌ Eliminieren:     1 (z.B. Status-Meeting ohne Ergebnis)

Nächster Schritt: /analyse
```

---

## Mehrere Sessions

Du kannst `/inventur` mehrfach aufrufen — neue Aktivitäten werden zu bestehenden ergänzt. Duplikate erkenne ich automatisch.

---

## Wenn Tools verbunden sind

**~~calendar verbunden:**
- Ich analysiere deine letzten 4 Wochen Kalender
- Erkenne Muster: Welche Meeting-Typen? Wie viel Reisezeit? Welche Regelmäßigkeiten?
- Schlage Aktivitäten vor die du dann bestätigst oder anpasst

**~~chat verbunden:**
- Ich schaue welche Themen in deinen Chat-Gesprächen immer wiederkehren
- "Du wirst oft nach X gefragt" → potenzielle Aktivität

---

## Tipps

1. **30 Minuten einplanen** — Die Qualität der Analyse hängt von der Vollständigkeit der Erfassung ab.
2. **Nichts auslassen** — Auch kleine, scheinbar unwichtige Aufgaben können Automatisierungspotenzial haben.
3. **Ehrlich beim Energie-Status** — "Kostet Energie" ist kein Versagen, sondern ein Hinweis auf Optimierungspotenzial.
4. **Fokus-Parameter nutzen** — `/inventur Kundenservice` wenn du nur einen Bereich erfassen möchtest.
