---
description: Fertigen Automatisierungs-Baustein generieren — Apps Script, Claude Skill, Artifact oder Anleitung
argument-hint: "<Aktivität oder Vorschlags-ID>"
allowed-tools: ["Read", "Write"]
---

# /baustein

> Wenn du unbekannte Platzhalter siehst oder prüfen möchtest welche Tools verbunden sind, schau in [CONNECTORS.md](../CONNECTORS.md).

Generiere einen fertigen, einsatzbereiten Automatisierungs-Baustein für eine Aktivität aus deiner Inventur. Das Ergebnis ist direkt verwendbar — kein weiterer Programmieraufwand nötig.

## Verwendung

```
/baustein Wochenbericht
```

Oder mit Vorschlags-ID aus /vorschlaege:

```
/baustein #1
```

Oder ohne Argument — ich zeige dann deine Top-Kandidaten:

```
/baustein
```

---

## Wie es funktioniert

```
┌─────────────────────────────────────────────────────────────────┐
│                         /baustein                                │
├─────────────────────────────────────────────────────────────────┤
│  STANDALONE (funktioniert immer)                                 │
│  ✓ Liest Aktivität aus context/ oder du beschreibst sie         │
│  ✓ Bestimmt passendes Delivery-Format                           │
│  ✓ Generiert vollständigen Baustein mit Beschreibung            │
│  ✓ Apps Script: Fertiger Code zum Einfügen                      │
│  ✓ Claude Skill: Vollständige SKILL.md mit Trigger-Phrases      │
│  ✓ Artifact: Ausfüllbare Vorlage oder Dashboard                 │
│  ✓ Anleitung: Schritt-für-Schritt Konfigurations-Guide          │
├─────────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (wenn Tools verbunden sind)                        │
│  + Code-Generierung angepasst an verbundene MCP-Server          │
│  + Apps Script direkt in ~~drive speichern                      │
│  + Skill-ZIP direkt für Claude Desktop konfigurieren            │
│  + Testen mit echten Daten aus verbundenen Systemen             │
└─────────────────────────────────────────────────────────────────┘
```

---

## Delivery-Formate

### Apps Script
**Wann:** Aktivität nutzt Google Workspace (Gmail, Sheets, Calendar, Docs, Drive).
**Was du bekommst:** Fertiger JavaScript-Code für den Script-Editor + Schritt-für-Schritt Setup-Anleitung.

```javascript
// Beispiel: Wochenbericht-Generator
function erstelleWochenbericht() {
  const sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('KPIs');
  const daten = sheet.getDataRange().getValues();
  // ... vollständiger Code folgt
}
```

**Setup:** Code kopieren → Google Apps Script öffnen → Einfügen → Trigger setzen → Fertig.

---

### Claude Skill ZIP
**Wann:** KI-gestützter Prozess der in Claude Desktop läuft.
**Was du bekommst:** `SKILL.md` mit Frontmatter, Trigger-Phrases, vollständiger Anleitung + Verpackungs-Anweisung.

```markdown
---
name: wochenbericht-erstellen
description: Erstellt Wochenbericht wenn Nutzer "Wochenbericht", "Weekly" oder "Bericht erstellen" sagt.
---

# Wochenbericht erstellen
...vollständiger Skill folgt
```

**Setup:** Skill-Ordner erstellen → SKILL.md einfügen → Als Projekt in Claude Desktop öffnen.

---

### Artifact
**Wann:** Template, Dashboard oder strukturiertes Dokument.
**Was du bekommst:** Fertige HTML/Markdown-Vorlage zum direkten Verwenden oder Ausfüllen.

**Beispiele:**
- Meeting-Protokoll-Vorlage (Markdown mit Platzhaltern)
- KPI-Dashboard (HTML mit Visualisierungen)
- Checkliste (Markdown mit Checkboxen)

---

### Konfigurations-Anleitung
**Wann:** MCP-Server-basierte Automatisierung oder komplexe Integration.
**Was du bekommst:** Schritt-für-Schritt Anleitung mit allen Einstellungen, Filtern und Regeln.

**Beispiele:**
- Gmail-Filter-Regeln mit Labels
- CRM-Workflow-Konfiguration
- Zapier/Make-Automations-Setup

---

## Output

```
✅ Baustein: Wochenbericht

Format: Apps Script
Datei:  wochenbericht.gs

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Was dieser Baustein macht:
Liest KPI-Daten aus deiner Google Sheets Tabelle, formatiert
einen strukturierten Wochenbericht und mailt ihn automatisch
jeden Montag an dich und dein Team.

Voraussetzungen:
✓ Google Sheets Tabelle mit KPI-Daten
✓ Google Apps Script Zugang (kostenlos)
✓ Gmail-Konto

Zeitersparnis: ~2h/Woche → ~10 Min (93% Reduktion)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// ====== WOCHENBERICHT-GENERATOR ======
// Füge diesen Code in Google Apps Script ein
// Anleitung: Schritt 3 unten

function erstelleWochenbericht() {
  const SHEET_ID = 'DEINE-SHEET-ID'; // Ändern!
  const EMPFAENGER = 'deine@email.de'; // Ändern!

  const sheet = SpreadsheetApp
    .openById(SHEET_ID)
    .getSheetByName('KPIs');

  // ... vollständiger Code ...
}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Setup in 3 Schritten:

1. Code anpassen
   → Zeile 6: Deine Google Sheets ID eintragen
   → Zeile 7: Deine E-Mail eintragen

2. In Apps Script einfügen
   → sheets.google.com → Erweiterungen → Apps Script
   → Code einfügen → Speichern

3. Trigger setzen
   → Uhren-Symbol links → Trigger hinzufügen
   → Funktion: erstelleWochenbericht
   → Zeitbasiert: Jede Woche, Montag, 07:00 Uhr

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Nächster Schritt: /baustein Status-Update (#2)
```

---

## Wenn Tools verbunden sind

**~~drive verbunden:**
- Ich speichere den generierten Code direkt in deinem Drive
- Kein Copy-Paste nötig

**Passender MCP für die Aktivität verbunden:**
- Code wird auf deine spezifische Systemkonfiguration zugeschnitten
- Ich kann die Automatisierung direkt testen und validieren

---

## Tipps

1. **Einen Baustein vollständig umsetzen** — Bevor du den nächsten startest.
2. **Setup-Anleitung folgen** — Jeder Baustein kommt mit vollständiger Anleitung.
3. **Mit echten Daten testen** — Bevor du den Trigger aktivierst, teste manuell.
4. **Anpassungen beschreiben** — "Sende den Bericht nicht an alle, sondern nur an mich" → ich passe den Code an.
