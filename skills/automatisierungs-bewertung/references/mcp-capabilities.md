# MCP-Capabilities: Was ist mit welchem Server möglich?

Diese Referenz dokumentiert die konkreten Fähigkeiten verfügbarer MCP-Server und welche Automatisierungs-Bausteine damit realisierbar sind.

## Google Workspace MCP (`@anthropic/google-workspace-mcp`)

### Gmail

| Fähigkeit | MCP-Tool | Automatisierungs-Anwendung |
|---|---|---|
| E-Mail lesen | `gmail_list_messages`, `gmail_get_message` | Eingehende Aufgaben erkennen, Aktivitäten aus E-Mails ableiten |
| E-Mail-Entwurf erstellen | `gmail_create_draft` | Wöchentliche Status-Reports vorbereiten |
| E-Mail senden | `gmail_send_email` | Automatische Benachrichtigungen, Erinnerungen |
| Labels verwalten | `gmail_modify_labels` | E-Mails automatisch kategorisieren |
| Filter einrichten | Manuell (keine API) | — |

### Google Calendar

| Fähigkeit | MCP-Tool | Automatisierungs-Anwendung |
|---|---|---|
| Termine lesen | `calendar_list_events` | Aktivitäten aus Kalender-Einträgen ableiten |
| Termin erstellen | `calendar_create_event` | Regelmäßige Review-Sessions automatisch anlegen |
| Termin aktualisieren | `calendar_update_event` | Status-Updates in Kalender-Beschreibung spiegeln |
| Termin löschen | `calendar_delete_event` | Abgeschlossene Aktivitäten aus Kalender entfernen |

### Google Sheets

| Fähigkeit | MCP-Tool | Automatisierungs-Anwendung |
|---|---|---|
| Daten lesen | `sheets_get_values` | Aktivitäten-CSV laden, Analyse-Daten abrufen |
| Daten schreiben | `sheets_update_values` | Neue Aktivitäten hinzufügen, Status aktualisieren |
| Zeilen anhängen | `sheets_append_values` | Neue Erfassung direkt in Sheet schreiben |
| Formatierung setzen | `sheets_batch_update` | Dashboard-Zellen farblich markieren |

### Google Docs

| Fähigkeit | MCP-Tool | Automatisierungs-Anwendung |
|---|---|---|
| Dokument lesen | `docs_get_document` | Prozess-Beschreibungen abrufen |
| Dokument erstellen | `docs_create_document` | Automatisierungs-Bausteine als Docs exportieren |
| Inhalt einfügen | `docs_insert_text` | Reports in bestehendes Dokument schreiben |

### Google Drive

| Fähigkeit | MCP-Tool | Automatisierungs-Anwendung |
|---|---|---|
| Dateien suchen | `drive_search_files` | Vorhandene Aktivitäten-CSVs finden |
| Datei hochladen | `drive_upload_file` | Generierte Bausteine ablegen |
| Berechtigungen setzen | `drive_share_file` | Bausteine mit Team teilen |

---

## Entscheidungshilfe: Standalone vs. Supercharged

### Standalone (kein MCP verfügbar)

Was Claude alleine kann:
- Aktivitäten im Dialog erfassen
- CSV-Datei analysieren (wenn hochgeladen)
- Automatisierungs-Vorschläge beschreiben
- Apps Script Code generieren (als Textblock)
- Prozess-Dokumentation erstellen
- Entscheidungsmatrix anwenden

### Supercharged (mit Google Workspace MCP)

Zusätzlich möglich:
- Aktivitäten direkt aus Kalender/E-Mails ableiten
- Erfasste Aktivitäten sofort in Sheets schreiben
- Wöchentliche Reports automatisch per E-Mail senden
- Review-Termine automatisch anlegen
- Apps Script direkt in Google Apps Script deployen

---

## MCP-Server-Erkennung

Beim Start des Plugins prüfen ob MCP-Server verfügbar:

```
Falls ~~sheets verfügbar → Supercharged-Modus für Sheets
Falls ~~calendar verfügbar → Supercharged-Modus für Calendar
Falls ~~email verfügbar → Supercharged-Modus für Gmail
Falls nichts verfügbar → Standalone-Modus
```

Claude erkennt verfügbare Tools automatisch aus dem System-Kontext. Wenn MCP-Tools aufrufbar sind, Supercharged-Empfehlungen bevorzugen.
