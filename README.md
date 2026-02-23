# KIO Aktivitäten-Plugin

Ein Cowork-Plugin für Claude Desktop, das die komplette Aktivitäten-Journey begleitet: Erfassen, Analysieren, Automatisierungen vorschlagen, konkrete Bausteine generieren. Standalone ohne MCP-Server sofort einsatzbereit — mit angeschlossenen Tools (Google Workspace, CRM) deutlich mächtiger.

## Überblick

Wo verbringt dein Team die meiste Zeit? Was kostet Energie? Was könnte automatisiert werden? Dieses Plugin hilft dir, Antworten zu finden und direkt in handlungsfertige Bausteine umzusetzen.

```
Inventur → Analyse → Vorschläge → Bausteine
```

## Komponenten

### Commands — Explizite Workflows per Slash-Befehl

| Command | Beschreibung |
|---------|-------------|
| `/start` | Profil anlegen — Name, Rolle, Team, verwendete Systeme |
| `/inventur` | Geführte 30-Min Aktivitäts-Erfassungs-Session (mit inventur-coach Agent) |
| `/analyse` | Dashboard mit 7 Dimensionen: Zeitverteilung, Energie, Automatisierungspotenzial |
| `/vorschlaege` | Top-5 Automatisierungsvorschläge mit Impact/Effort-Bewertung |
| `/baustein` | Fertigen Baustein generieren: Apps Script, Skill-ZIP, Artifact oder Anleitung |
| `/status` | Fortschritts-Überblick: Erfasst, Analysiert, Automatisiert |

### Skills — Domänenwissen das automatisch greift

| Skill | Beschreibung | Trigger-Beispiele |
|-------|-------------|-------------------|
| `aktivitaeten-erfassen` | Einzelne Aktivität im Dialog aufnehmen | "Ich mache...", "Neue Aktivität" |
| `aktivitaeten-analyse` | 7-Dimensionen-Dashboard aus CSV-Daten | "Analysiere meine Aktivitäten" |
| `prozess-beschreiben` | Prozess einer Aktivität strukturieren | "Wie läuft das ab?", "Beschreib den Prozess" |
| `automatisierungs-bewertung` | Automatisierbarkeit einer Aktivität bewerten | "Kann man das automatisieren?" |
| `vorschlags-engine` | Top-Automatisierungsvorschläge aus Inventur | "Was kann ich automatisieren?" |
| `baustein-generator` | Fertigen Baustein in passendem Format erstellen | "Bau mir das", "Erstelle den Baustein" |
| `wochen-review` | Wöchentlicher Fortschrittsbericht | "Wie läuft's?", "Wochen-Update" |

### Agent — Dialoggeführte Erfassung

| Agent | Beschreibung |
|-------|-------------|
| `inventur-coach` | Führt durch eine strukturierte 30-Min Aktivitäts-Inventur in 4 Phasen |

## Setup

### Schritt 1: Plugin in Claude Desktop öffnen

Öffne den `kio-aktivitaeten` Ordner als Claude Desktop Projekt.

### Schritt 2 (Optional): MCP-Server verbinden

Für die Supercharged-Funktionen kannst du Google Workspace verbinden:

```bash
# Voraussetzung: Node.js installiert
npx -y @anthropic/google-workspace-mcp
```

Oder trage deine eigenen MCP-Server in `.mcp.json` ein. Alle verfügbaren Konnektoren und Platzhalter sind in [CONNECTORS.md](CONNECTORS.md) dokumentiert.

### Schritt 3: Profil anlegen

```
/start
```

Legt dein Profil an (Name, Rolle, Team, Systeme). Einmalig notwendig.

## Nutzung

### Erste Aktivitäts-Inventur

```
/inventur
```

Der `inventur-coach` Agent führt dich in ~30 Minuten durch eine strukturierte Erfassung aller Team-Aktivitäten. Ergebnis: `context/aktivitaeten.json` mit allen Aktivitäten.

### Aktivitäten analysieren

```
/analyse
```

Läd deine Aktivitäten (aus `context/aktivitaeten.json` oder CSV-Upload) und erstellt ein Dashboard mit 7 Dimensionen: Zeitverteilung, Energie-Bilanz, Frequenz-Matrix, Wert-Aufwand-Verhältnis, Automatisierungs-Kandidaten, Bottlenecks, Empfehlungen.

### Vorschläge generieren

```
/vorschlaege
```

Nutzt deine Analyse um die Top-5 Automatisierungsvorschläge zu identifizieren — gerankt nach Impact/Effort-Verhältnis, mit Angabe des passenden Delivery-Formats.

### Baustein erstellen

```
/baustein [Aktivität oder Vorschlags-ID]
```

Generiert einen fertigen, einsatzbereiten Baustein im passenden Format:
- **Apps Script**: Wenn Google Workspace-Automatisierung ohne MCP
- **Claude Skill ZIP**: Wenn KI-gestützter Prozess mit Claude Desktop
- **Artifact**: Wenn Template oder Dashboard
- **Konfigurations-Anleitung**: Wenn MCP-gestützter Workflow

### Fortschritt verfolgen

```
/status
```

Zeigt Überblick: X Aktivitäten erfasst, Y analysiert, Z Vorschläge offen, A Bausteine erstellt.

## Standalone + Supercharged

Jedes Command und jeder Skill funktioniert ohne MCP-Verbindungen:

| Was du tun kannst | Standalone | Supercharged mit |
|-------------------|-----------|------------------|
| Aktivitäten erfassen | Dialog-basiert, manuelle Eingabe | `~~calendar` (Termine als Basis), `~~chat` (Team-Aktivitäten) |
| Aktivitäten analysieren | CSV-Upload oder manuelle Liste | `~~sheets` (direkte Datenquelle) |
| Vorschläge generieren | Basierend auf Aktivitätsliste | MCP-Capability-Matching (was ist wirklich umsetzbar?) |
| Bausteine erstellen | Beschreibung + Anleitung | Code-Generierung wenn passender MCP verfügbar |
| Fortschritt tracken | Lokale JSON-Dateien | `~~project-tracker` (Sync mit Aufgaben-Tool) |

## MCP-Integrationen

Verbinde deine Tools für bessere Ergebnisse:

| Kategorie | Beispiele | Was es ermöglicht |
|-----------|-----------|-------------------|
| **Google Workspace** | Gmail, Calendar, Sheets, Drive, Docs | Aktivitäten aus Kalender lesen, Analyse in Sheets speichern |
| **CRM** | HubSpot, Pipedrive, Salesforce | Kundenbezogene Aktivitäten erkennen |
| **Project Tracker** | Linear, Asana, Jira | Fortschritt synchronisieren |
| **Chat** | Slack, Teams | Team-Aktivitäten aus Gesprächen ableiten |

Alle Konnektoren und `~~category` Platzhalter sind in [CONNECTORS.md](CONNECTORS.md) dokumentiert.
