# Baustein-Templates: Output-Formate pro Delivery-Format

Templates und Strukturvorgaben für jeden Baustein-Typ den der `baustein-generator` Skill erzeugt.

---

## Delivery-Format 1: Apps Script Code

**Wann:** Wenn die Automatisierung im Hintergrund laufen soll (Trigger-basiert).

### Template-Struktur

```javascript
/**
 * [AKTIVITÄT]: [KURZBESCHREIBUNG]
 *
 * Pattern: [PATTERN-NAME]
 * Erstellt: [DATUM]
 * Plugin: kio-aktivitaeten
 */

// === KONFIGURATION (hier anpassen) ===
const CONFIG = {
  SHEET_ID: 'DEINE_SHEET_ID_HIER',     // Google Sheet ID aus der URL
  SHEET_NAME: 'Aktivitäten',            // Name des Tabellenblatts
  EMAIL_EMPFAENGER: 'name@beispiel.de', // Empfänger-E-Mail
  BETREFF: '[AUTO] [AKTIVITÄT]',        // E-Mail-Betreff
};

// === HAUPTFUNKTION ===
function main() {
  // 1. Daten lesen
  const sheet = SpreadsheetApp.openById(CONFIG.SHEET_ID)
    .getSheetByName(CONFIG.SHEET_NAME);
  const daten = sheet.getDataRange().getValues();

  // 2. Verarbeitung
  const ergebnis = verarbeite(daten);

  // 3. Output
  sendeReport(ergebnis);
}

// === HILFSFUNKTIONEN ===
function verarbeite(daten) {
  // [LOGIK HIER EINFÜGEN]
  return daten;
}

function sendeReport(inhalt) {
  GmailApp.sendEmail(
    CONFIG.EMAIL_EMPFAENGER,
    CONFIG.BETREFF,
    inhalt
  );
}

// === TRIGGER-SETUP ===
// Einmalig ausführen um Trigger zu erstellen:
function triggerErstellen() {
  ScriptApp.newTrigger('main')
    .timeBased()
    .everyWeeks(1)
    .onWeekDay(ScriptApp.WeekDay.MONDAY)
    .atHour(8)
    .create();
  Logger.log('Trigger erstellt: Jeden Montag um 8 Uhr');
}
```

### Installations-Anleitung (immer beifügen)

```markdown
## Installations-Anleitung

1. **Google Apps Script öffnen:** https://script.google.com
2. **Neues Projekt erstellen** → Code einfügen
3. **CONFIG anpassen:**
   - `SHEET_ID`: Aus der URL deines Sheets kopieren
     (https://docs.google.com/spreadsheets/d/**[ID]**/edit)
   - `EMAIL_EMPFAENGER`: Deine E-Mail-Adresse
4. **Einmalig ausführen:** `triggerErstellen()` → Berechtigungen erlauben
5. **Testen:** `main()` direkt ausführen und E-Mail prüfen

**Fertig! Der Trigger läuft automatisch.**
```

---

## Delivery-Format 2: Claude Skill ZIP

**Wann:** Wenn ein neuer Dialog-Skill ins Plugin soll.

### Verzeichnis-Struktur

```
{skill-name}/
  SKILL.md              # Skill-Definition (Pflicht)
  references/
    {referenz}.md       # Benötigte Referenzen
```

### SKILL.md Template

```markdown
---
name: {skill-name}
description: >
  Dieser Skill [BESCHREIBUNG IN DRITTER PERSON MIT TRIGGER-PHRASES].
  Trigger: "[PHRASE 1]", "[PHRASE 2]", "[PHRASE 3]".
---

# {Skill-Titel}

## Standalone (ohne MCP)

[BESCHREIBUNG WAS CLAUDE OHNE TOOLS MACHT]

### Schritt 1: [SCHRITT-TITEL]
[ANWEISUNG]

### Schritt 2: [SCHRITT-TITEL]
[ANWEISUNG]

## Supercharged (mit MCP)

[BESCHREIBUNG WAS CLAUDE MIT TOOLS ZUSÄTZLICH MACHT]

### MCP-Erweiterungen
- Bei verfügbarem ~~sheets: [KONKRETE AKTION]
- Bei verfügbarem ~~email: [KONKRETE AKTION]

## Output-Format

[BESCHREIBUNG DES ERWARTETEN OUTPUTS]
```

### ZIP-Erstellung (Anleitung)

```bash
# Im plugin-Verzeichnis:
zip -r {skill-name}.zip {skill-name}/
```

---

## Delivery-Format 3: Artifact-Template

**Wann:** Wenn eine visuelle Darstellung (Dashboard, Analyse-Ansicht) gebraucht wird.

### HTML-Artifact Template

```html
<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <title>[AKTIVITÄT]: [TITEL]</title>
  <style>
    body { font-family: system-ui, sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; }
    .header { background: #6B21A8; color: white; padding: 16px; border-radius: 8px; margin-bottom: 20px; }
    .metric { background: #F3F4F6; padding: 12px; border-radius: 6px; text-align: center; }
    .metric .value { font-size: 2em; font-weight: bold; color: #6B21A8; }
    .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 12px; }
    table { width: 100%; border-collapse: collapse; }
    th { background: #E9D5FF; padding: 8px; text-align: left; }
    td { padding: 8px; border-bottom: 1px solid #E5E7EB; }
  </style>
</head>
<body>
  <div class="header">
    <h1>[TITEL]</h1>
    <p>Stand: [DATUM] | Plugin: kio-aktivitaeten</p>
  </div>

  <!-- Metriken -->
  <div class="grid" style="margin-bottom: 20px;">
    <div class="metric">
      <div class="value">[WERT_1]</div>
      <div>[LABEL_1]</div>
    </div>
    <div class="metric">
      <div class="value">[WERT_2]</div>
      <div>[LABEL_2]</div>
    </div>
  </div>

  <!-- Tabelle -->
  <table>
    <thead>
      <tr><th>Aktivität</th><th>Status</th><th>Energie</th><th>Stunden/Woche</th></tr>
    </thead>
    <tbody>
      <!-- [ZEILEN HIER EINFÜGEN] -->
    </tbody>
  </table>
</body>
</html>
```

---

## Delivery-Format 4: Konfigurations-Anleitung

**Wann:** Wenn die Lösung manuelle Einstellungen in Google Workspace erfordert.

### Anleitung-Template

```markdown
# Konfigurations-Anleitung: [AKTIVITÄT]

**Zeitaufwand:** ca. [X] Minuten
**System:** [Google Gmail / Calendar / Sheets / etc.]

## Schritt 1: [SCHRITT-TITEL]

1. Öffne [SYSTEM-NAME]: [URL]
2. Navigiere zu: [PFAD/EINSTELLUNG]
3. Klicke auf: [BUTTON/LINK]
4. Setze ein: [WERT/EINSTELLUNG]

**Screenshot-Hilfe:** [BESCHREIBUNG WO MAN KLICKT]

## Schritt 2: [SCHRITT-TITEL]

[...]

## Ergebnis

Wenn alles korrekt eingestellt ist, [BESCHREIBUNG DES ERWARTETEN RESULTATS].

## Troubleshooting

| Problem | Lösung |
|---|---|
| [TYPISCHES PROBLEM] | [LÖSUNG] |
```

---

## Baustein-Ausgabe-Checkliste

Vor der Ausgabe prüfen ob der Baustein enthält:

- [ ] Korrektes Delivery-Format (passend zur Entscheidungsmatrix)
- [ ] CONFIG-Abschnitt mit allen anpassbaren Werten (bei Apps Script)
- [ ] Installations-Anleitung (bei Apps Script und Skill ZIP)
- [ ] Benutzer-freundliche Kommentare im Code
- [ ] Standalone-Variante falls MCP nicht verfügbar
- [ ] Geschätzte Setup-Zeit

## Naming-Konventionen

| Format | Dateiname-Muster | Beispiel |
|---|---|---|
| Apps Script | `{aktivitaet}-automation.gs` | `report-automation.gs` |
| Skill ZIP | `skill-{name}.zip` | `skill-wochen-review.zip` |
| Artifact | (kein Dateiname — direkt in Chat) | — |
| Anleitung | `{aktivitaet}-setup.md` | `gmail-filter-setup.md` |
