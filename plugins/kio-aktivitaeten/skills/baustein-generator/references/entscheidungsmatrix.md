# Entscheidungsmatrix: Automatisierungsvorschläge

Diese Matrix bestimmt, welches Delivery-Format für eine Automatisierungs-Idee empfohlen wird.

## Teil A — Delivery-Format-Entscheidung

Welcher Lösungstyp passt zum Traum-Ergebnis?

| Wenn das Traum-Ergebnis... | Dann ist das Format... | Beispiel |
|---|---|---|
| "...wäre schon fertig/erledigt" (automatisch im Hintergrund) | **Apps Script** (Trigger-basiert) | E-Mails sortiert, Report verschickt, Daten synchronisiert |
| "...könnte ich auf einen Blick sehen" (Übersicht/Dashboard) | **Artifact** (Snapshot) oder **Apps Script Web App** (Live) | KPI-Dashboard, Statusübersicht, Zeitauswertung |
| "...müsste ich nur noch bestätigen" (Dialog/Assistent) | **Claude Skill** (neuer Skill fürs Projekt) | Angebote prüfen, Texte generieren, Checklisten |
| "...wäre richtig eingestellt" (Konfiguration) | **Manuell in Workspace** (Einstellung zeigen) | Gmail-Filter, Kalender-Regeln, Sheet-Formeln |

**Entscheidungsregel:** Wenn das Traum-Ergebnis zu mehreren Formaten passt, bevorzuge in dieser Reihenfolge: Manuell in Workspace (einfachste Lösung) > Apps Script (automatisch) > Artifact (visuell) > Claude Skill (interaktiv).

## Teil B — System-zu-Lösung-Mapping

Was ist mit dem genannten System technisch möglich?

| System (vom User genannt) | Mögliche Lösungen | Delivery-Format |
|---|---|---|
| Gmail / E-Mail | Filter erstellen, Labels verwalten, Auto-Weiterleitung, täglicher E-Mail-Digest | Apps Script (GmailApp) oder manuell (Gmail-Filter) |
| Google Sheets | Automatische Berechnungen, Zeilen verarbeiten, Cross-Sheet-Sync, Custom Functions | Apps Script (SpreadsheetApp) |
| Google Calendar | Termine automatisch erstellen, Einladungen verschicken, Erinnerungen | Apps Script (CalendarApp) |
| Google Drive | Dokumente aus Vorlagen erstellen, Dateien sortieren, Berechtigungen setzen | Apps Script (DriveApp) |
| Google Docs | Berichte/Protokolle aus Vorlage generieren und befüllen | Apps Script (DocumentApp) |
| Reports / Berichte | Automatischer Versand per E-Mail mit Daten aus Sheet | Apps Script (Scheduled Report) |
| Dashboard / Übersicht | Visuelle Auswertung mit Charts und KPIs | Artifact (Snapshot) oder Apps Script Web App (Live) |
| Wiederkehrende Texte | Vorlagen, Antwortvorschläge, Textbausteine | Claude Skill |
| Checklisten / Prüfungen | Strukturierte Prüfung mit Entscheidungslogik | Claude Skill oder Artifact (Entscheidungsbaum) |
| Daten zwischen Systemen | Google Workspace intern: Sync zwischen Sheets/Docs/Calendar | Apps Script (Cross-Service) |
| System außerhalb Google | Odoo, Slack, SAP, Jira, etc. | "Sprich mit deinem KIO-Berater" |

## Teil C — Automatisierungs-Pattern

Welches Muster passt zur Idee?

| Pattern | Beschreibung | Typischer Trigger |
|---|---|---|
| Scheduled Report | Daten aus Sheet lesen, als E-Mail verschicken | "Ich will täglich/wöchentlich einen Bericht" |
| Sheet-Automation | Bei neuer Zeile/Änderung automatisch verarbeiten | "Wenn jemand etwas einträgt, soll automatisch..." |
| Live-Dashboard | Web App die immer aktuelle Daten zeigt | "Ich will auf einen Blick sehen wo wir stehen" |
| Cross-Service | Sheet -> Calendar + Mail + Docs | "Das muss in mehreren Systemen passieren" |
| Dialog-Assistent | Claude führt durch strukturierte Aufgabe | "Ich will Schritt für Schritt durchgeführt werden" |
| Snapshot-Analyse | Einmalige visuelle Auswertung | "Zeig mir eine Analyse von..." |

## Teil D — MCP-Erweiterungen (Supercharged)

Wenn MCP-Server verfügbar sind, erweitern sich die Möglichkeiten erheblich:

| Delivery-Format | Standalone | Mit Google Workspace MCP |
|---|---|---|
| **Apps Script** | Code-Template generieren + manuelle Installation | Direkt in Google Apps Script schreiben via MCP |
| **Artifact** | Statische HTML/JS Visualisierung | Live-Daten aus Sheets direkt einlesen |
| **Claude Skill** | Textbasierte Logik | Sheets schreiben, Calendar-Events erstellen, Mails senden |
| **Manuell** | Schritt-für-Schritt Anleitung | Direkte Konfiguration via MCP-Calls |

### MCP-Capability-Check

Vor der Empfehlung prüfen welche MCP-Server verfügbar sind:

```
Verfügbare MCP-Server → Supercharged-Optionen freischalten
Kein MCP-Server → Standalone-Modus empfehlen
```

Referenz: `references/mcp-capabilities.md` für detaillierte MCP-Fähigkeiten pro Server.
