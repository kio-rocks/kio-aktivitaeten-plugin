---
description: Profil anlegen — Name, Rolle, Team und verwendete Systeme erfassen
argument-hint: "<Name>"
allowed-tools: ["Read", "Write"]
---

# /start

> Wenn du unbekannte Platzhalter siehst oder prüfen möchtest welche Tools verbunden sind, schau in [CONNECTORS.md](../CONNECTORS.md).

Lege dein Profil an. Einmalig notwendig — danach kennt das Plugin deinen Kontext und alle anderen Commands funktionieren gezielter.

## Verwendung

```
/start
```

Oder direkt mit deinem Namen:

```
/start Max Mustermann
```

---

## Wie es funktioniert

```
┌─────────────────────────────────────────────────────────────────┐
│                          /start                                  │
├─────────────────────────────────────────────────────────────────┤
│  STANDALONE (funktioniert immer)                                 │
│  ✓ Interaktiver Dialog: Name, Rolle, Team, Systeme              │
│  ✓ Schreibt context/profil.json                                 │
│  ✓ Zeigt Zusammenfassung zur Bestätigung                        │
│  ✓ Empfiehlt nächsten Schritt (/inventur)                       │
├─────────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (wenn Tools verbunden sind)                        │
│  + ~~directory: Liest Profildaten automatisch aus dem Verzeichnis│
│  + ~~hr: Übernimmt Rolle und Team aus HR-System                 │
│  + Direkte Übernahme statt manuelle Eingabe                     │
└─────────────────────────────────────────────────────────────────┘
```

---

## Dialog-Schritte (Standalone)

Ich stelle dir vier Fragen:

### 1. Name
"Wie heißt du?" — Vorname reicht, Nachname optional.

### 2. Rolle
"Was ist deine Rolle?" — Z.B. "Teamleiterin Vertrieb", "Projektmanager", "Assistenz der Geschäftsführung".

### 3. Team
"In welchem Team oder Bereich arbeitest du?" — Z.B. "Marketing", "Operations", "Finance", "Kundenservice".

### 4. Systeme
"Welche digitalen Systeme nutzt du täglich?" — Z.B. "Gmail, Google Calendar, HubSpot, Slack, Excel". Kein System vergessen, auch interne Tools sind wichtig.

---

## Ergebnis

Nach dem Dialog schreibe ich `context/profil.json`:

```json
{
  "name": "Max Mustermann",
  "rolle": "Teamleiter Operations",
  "team": "Operations",
  "systeme": ["Gmail", "Google Calendar", "Google Sheets", "Slack", "SAP"],
  "erstellt": "2026-02-23",
  "aktualisiert": "2026-02-23"
}
```

Und zeige eine Bestätigung:

```
✅ Profil gespeichert

Name:     Max Mustermann
Rolle:    Teamleiter Operations
Team:     Operations
Systeme:  Gmail, Google Calendar, Google Sheets, Slack, SAP

Nächster Schritt: /inventur
Starte eine geführte 30-Minuten-Session um deine Team-Aktivitäten zu erfassen.
```

---

## Profil aktualisieren

Einfach erneut `/start` aufrufen — ich frage ob du das bestehende Profil überschreiben möchtest.

---

## Wenn Tools verbunden sind

**~~directory oder ~~hr verbunden:**
- Ich lese Name, Rolle und Team automatisch aus dem System
- Du bestätigst die übernommenen Daten oder korrigierst sie
- Systeme ergänzt du manuell (die stehen selten im Verzeichnis)

---

## Tipps

1. **Systeme vollständig angeben** — Je mehr Systeme du nennst, desto besser kann ich MCP-Automatisierungen vorschlagen.
2. **Rolle konkret formulieren** — "Teamleiterin" hilft mir mehr als "Manager".
3. **Team nicht vergessen** — Viele Aktivitäten unterscheiden sich nach Bereich.
