# Pattern-Katalog: Automatisierungs-Patterns

Beschreibung aller unterstützten Automatisierungs-Patterns mit Beispielen und Umsetzungshinweisen.

---

## Pattern 1: Scheduled Report

**Beschreibung:** Daten aus einer Quelle lesen, aufbereiten und regelmäßig per E-Mail versenden.

**Typischer Auslöser:** "Ich schicke jeden Montag eine Zusammenfassung...", "Ich erstelle täglich einen Status-Report..."

**Beispiele:**
- Wöchentlicher Aktivitäten-Fortschritt per E-Mail
- Täglicher Kalender-Überblick für das Team
- Monatliche Zeitauswertung aus Aktivitäten-Sheet

**Standalone-Umsetzung:**
1. Claude erstellt Apps Script Code mit `ScriptApp.newTrigger()`
2. User kopiert Code in Google Apps Script
3. Trigger auf gewünschte Zeit einstellen

**Supercharged-Umsetzung:**
1. `sheets_get_values` → Daten lesen
2. Claude bereitet Report auf
3. `gmail_create_draft` oder `gmail_send_email` → Direkt senden
4. Optional: `calendar_create_event` für Erinnerung

**Setup-Aufwand:** 15-30 Minuten (Standalone) | 5 Minuten (Supercharged)

---

## Pattern 2: Sheet-Automation

**Beschreibung:** Bei Änderungen in einem Sheet automatisch reagieren — neue Zeilen verarbeiten, Status aktualisieren, andere Systeme benachrichtigen.

**Typischer Auslöser:** "Wenn jemand etwas einträgt, soll automatisch...", "Wenn sich der Status ändert..."

**Beispiele:**
- Neue Aktivität in Sheet → automatisch kategorisieren und Energie-Score berechnen
- Status-Änderung → E-Mail-Benachrichtigung an Teamleiter
- Wöchentliche Sheet-Zusammenfassung → automatisch in Docs-Report schreiben

**Standalone-Umsetzung:**
1. Apps Script mit `onEdit()` Trigger
2. `SpreadsheetApp.getActiveSheet()` für Daten-Zugriff
3. Deployment als gebundenes Script

**Supercharged-Umsetzung:**
1. `sheets_get_values` → Sheet-Stand prüfen
2. Verarbeitung durch Claude
3. `sheets_update_values` → Ergebnis zurückschreiben
4. Optional: `gmail_send_email` für Benachrichtigung

**Setup-Aufwand:** 20-40 Minuten (Standalone) | 10 Minuten (Supercharged)

---

## Pattern 3: Live-Dashboard

**Beschreibung:** Visuelle Aufbereitung von Daten die sich regelmäßig aktualisiert — entweder als statischer Snapshot oder als Web App.

**Typischer Auslöser:** "Ich will auf einen Blick sehen...", "Wir brauchen ein Dashboard..."

**Beispiele:**
- Team-Aktivitäten-Übersicht mit Status und Energie-Verteilung
- Automatisierungsfortschritt: X von Y Vorschlägen umgesetzt
- Wöchentliche Zeitverteilung nach Kategorie

**Standalone-Umsetzung (Snapshot/Artifact):**
1. Claude erstellt HTML/CSS/JS Artifact
2. Daten werden manuell eingegeben oder via CSV-Upload

**Standalone-Umsetzung (Apps Script Web App):**
1. `SpreadsheetApp.openById()` → Daten lesen
2. HTML-Template mit `HtmlService`
3. Als Web App deployen

**Supercharged-Umsetzung:**
1. `sheets_get_values` → Live-Daten
2. Claude generiert dynamisches Artifact mit echten Daten
3. Auf Wunsch: `drive_upload_file` für Archivierung

**Setup-Aufwand:** 5 Minuten (Snapshot) | 30 Minuten (Web App) | 2 Minuten (Supercharged Artifact)

---

## Pattern 4: Cross-Service

**Beschreibung:** Daten zwischen mehreren Google Workspace Diensten synchronisieren oder weiterleiten.

**Typischer Auslöser:** "Das muss in mehreren Systemen passieren", "Wenn X, dann aktualisiere Y und schreibe Z"

**Beispiele:**
- Aktivität erfasst → Sheet-Zeile + Calendar-Block + Mail-Notiz erstellt
- Wöchentlicher Report → Sheet aktualisiert + Doc erstellt + E-Mail verschickt
- Neuer Kunde in Sheet → Calendar-Termin + Willkommens-Mail automatisch

**Standalone-Umsetzung:**
1. Apps Script mit mehreren Service-Calls
2. `GmailApp`, `CalendarApp`, `SpreadsheetApp` kombinieren

**Supercharged-Umsetzung:**
1. Claude orchestriert mehrere MCP-Calls sequenziell
2. Fehlermeldungen und Bestätigungen direkt im Chat

**Setup-Aufwand:** 45-60 Minuten (Standalone) | 15 Minuten (Supercharged)

---

## Pattern 5: Dialog-Assistent

**Beschreibung:** Claude führt den User durch eine strukturierte Aufgabe — stellt Fragen, gibt Feedback, speichert Ergebnis.

**Typischer Auslöser:** "Ich will Schritt für Schritt durchgeführt werden", "Hilf mir das zu strukturieren"

**Beispiele:**
- Aktivitäten-Inventur (inventur-coach Agent)
- Wöchentliches Review-Gespräch
- Automatisierungs-Bewertung für eine neue Idee
- Prozess-Dokumentation im Dialog aufnehmen

**Umsetzung (immer als Claude Skill):**
1. SKILL.md mit strukturiertem Dialog-Flow
2. Phasen definieren (Warm-up, Erfassung, Strukturierung, Zusammenfassung)
3. Ergebnis in `context/` speichern

**Supercharged-Erweiterung:**
- Ergebnis direkt in Sheet schreiben (`sheets_append_values`)
- Calendar-Termin für nächsten Dialog anlegen
- Zusammenfassung per Mail versenden

**Setup-Aufwand:** Bereits im Plugin vorhanden (inventur-coach Agent)

---

## Pattern 6: Snapshot-Analyse

**Beschreibung:** Einmalige Analyse und Visualisierung — wird auf Abruf ausgeführt, nicht automatisch.

**Typischer Auslöser:** "Zeig mir eine Analyse von...", "Werte das mal aus"

**Beispiele:**
- Vollständige Aktivitäten-Analyse nach CSV-Upload (7 Dimensionen)
- Energie-Quadrant-Visualisierung für das Team
- Automatisierungs-Potenzial-Ranking

**Umsetzung:**
1. Daten hochladen oder via MCP laden
2. Claude analysiert und erstellt Artifact
3. Keine Speicherung nötig (einmalig)

**Supercharged-Erweiterung:**
- `sheets_get_values` statt manuellem Upload
- `drive_upload_file` für Archivierung des Artifacts

**Setup-Aufwand:** 0 Minuten (sofort nutzbar)

---

## Pattern-Auswahl-Quick-Guide

```
Regelmäßig + automatisch → Scheduled Report oder Sheet-Automation
Auf Knopfdruck sehen → Live-Dashboard oder Snapshot-Analyse
Mehrere Systeme → Cross-Service
Geführt werden → Dialog-Assistent
Einmalig analysieren → Snapshot-Analyse
```
