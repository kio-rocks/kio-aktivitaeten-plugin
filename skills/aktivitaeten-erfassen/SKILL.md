---
name: aktivitaeten-erfassen
description: Nimmt eine einzelne Aktivität im Dialog auf und speichert sie strukturiert. Wird ausgelöst durch "Ich mache...", "Neue Aktivität", "Das fehlt noch", "Aktivität hinzufügen" oder "/inventur" für Einzelerfassung. Standalone mit lokalem JSON-Speicher, supercharged mit ~~sheets für direkte Sheet-Speicherung.
---

# Aktivitäten erfassen

Mikro-Erfassung: Eine einzelne Aktivität im Dialog aufnehmen. Führt durch alle 7 Felder, speichert sofort.

## Connectors (Optional)

| Connector | Was er hinzufügt |
|-----------|-----------------|
| **~~sheets** | Neue Zeile direkt ins Aktivitäten-Sheet schreiben |
| **~~calendar** | Kalendereinträge als Aktivitäts-Vorschläge nutzen |

> **Keine Connectors?** Daten werden in `context/aktivitaeten.json` gespeichert. Beim nächsten CSV-Export eingeschlossen.

---

## Modus-Erkennung

### STANDALONE (keine Connectors)

```
Speicherort: context/aktivitaeten.json
Format: JSON-Array mit allen Feldern
Vorgehen: Fragen → Antworten sammeln → in JSON schreiben
```

### SUPERCHARGED (~~sheets verfügbar)

```
Speicherort: Google Sheets via MCP
Vorgehen: Fragen → Antworten sammeln → neue Zeile in Sheet anhängen
Sheet-ID aus context/profil.json (Feld: sheets_id)
```

---

## Schritt 1: Kontext herstellen

Lese `context/profil.json` um User-Kürzel und Namen zu ermitteln.

Falls `context/profil.json` nicht existiert oder kein Kürzel enthält:
- Frage einmal: "Wie heißt du? (Vorname reicht)"
- Generiere Kürzel aus den ersten zwei Buchstaben des Vornamens + laufende Nummer: `sk-001`

Bestimme die nächste Aktivitäts-ID:
- STANDALONE: Prüfe `context/aktivitaeten.json`, zähle vorhandene IDs für diesen User
- SUPERCHARGED: Prüfe Sheet nach vorhandenen IDs für diesen User

## Schritt 2: Aktivität im Dialog erfassen

Nutze die Fragenreihenfolge aus `references/frage-katalog.md`.

Optimale Reihenfolge für natürlichen Gesprächsfluss:

**Frage 1 — Name:**
"Wie heißt diese Aktivität? (kurze Bezeichnung, z.B. 'Kunden-E-Mails beantworten')"

**Frage 2 — Status:**
"Machst du das, weil es zu deiner Rolle gehört — oder aus einem anderen Grund?"

Optionen anbieten wenn der User zögert:
1. Gehört zu meiner Rolle
2. Weil es sonst niemanden gibt
3. Andere Lösung ist nötig
4. Mein Team führt es aus
5. Kein Prozess vorhanden
6. Prozess funktioniert nicht

**Frage 3 — Energie:**
"Gibt dir das Energie oder kostet es dich Energie?"

**Frage 4 — Frequenz:**
"Wie oft machst du das? (täglich / wöchentlich / monatlich / quartalsweise / jährlich)"

**Frage 5 — Zeit:**
"Wie viele Stunden verbringst du damit — pro [Frequenz aus Frage 4]?"

**Frage 6 — Quadrant:**
"Kannst du das gut — und magst du es?"

Matrix:
- "Kann ich gut, mag ich" → Liebe ich / großartig
- "Kann ich gut, mag ich nicht" → Mag ich nicht / gut
- "Kann ich nicht gut, mag ich" → Mag ich / lerne noch
- "Kann ich nicht gut, mag ich nicht" → Mag ich nicht / schlecht

**Frage 7 — Wert (optional):**
"Hat diese Aktivität einen direkten wirtschaftlichen Wert? (z.B. '50 € pro Stunde') — Das ist optional, du kannst es auch überspringen."

## Schritt 3: Kurzfassung zulassen

Wenn der User eine komprimierte Antwort gibt (z.B. "Emails beantworten, Rolle, Sauger, täglich 2h, gut/mag nicht"), mappe auf alle Felder und frage nur nach was noch fehlt.

## Schritt 4: Bestätigen und speichern

Zeige die erfasste Aktivität zur Bestätigung:

```
Ich trage folgende Aktivität ein:

ID: [kürzel]-[nummer]
Aktivität: [Name]
Wer: [Vorname]
Status: [Status]
Energie: [Energiegeber/Energiesauger]
Frequenz: [Frequenz]
Zeit: [Stunden] h / [Frequenz]
Quadrant: [Quadrant]
Wert: [Wert oder leer]

Soll ich das so speichern?
```

### STANDALONE — In JSON schreiben:

```json
{
  "id": "[kürzel]-[nummer]",
  "aktivitaet": "[Name]",
  "wer": "[Vorname]",
  "status": "[Status]",
  "energie": "[Energiegeber|Energiesauger]",
  "frequenz": "[täglich|wöchentlich|monatlich|quartalsweise|jährlich]",
  "stunden": [Zahl],
  "quadrant": "[Quadrant]",
  "wert": "[Wert oder null]",
  "erfasst_am": "[ISO-Datum]"
}
```

Anhängen an `context/aktivitaeten.json` Array.

### SUPERCHARGED — In Sheet schreiben:

```
~~sheets append [sheet_id] "Aktivitäten" [[id, aktivitaet, wer, status, energie, frequenz, stunden, quadrant, wert, datum]]
```

## Schritt 5: Weitermachen oder beenden

Nach dem Speichern fragen:
"Noch eine Aktivität? Sag mir die nächste oder sag 'fertig'."

Bei "fertig": "Ich habe [Anzahl] Aktivitäten in dieser Session erfasst. Du kannst die Analyse mit `/analyse` starten."

## Regeln

- Niemals Felder erfinden oder raten
- Wenn eine Antwort unklar ist, einmal nachfragen — dann akzeptieren
- IDs sind eindeutig pro User und werden nie wiederverwendet
- Sprache: Deutsch
- Duze den User
