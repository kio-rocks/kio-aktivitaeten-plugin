---
name: baustein-generator
description: Generiert einen fertigen, sofort nutzbaren Automatisierungs-Baustein für eine ausgewählte Aktivität. Vier Delivery-Formate: Apps Script Code, Claude Skill ZIP, Artifact-Template oder Konfigurations-Anleitung. Wird ausgelöst durch "Bau mir das", "Erstelle den Baustein", "Baustein [Nummer]", "Generiere das" oder "/baustein". Standalone mit Code-Template, supercharged mit direktem MCP-Deploy.
---

# Baustein-Generator

Generiert den fertigen Baustein für eine Automatisierung. Immer sofort einsatzbereit — mit Installations-Anleitung, anpassbaren Konfigurationswerten und Troubleshooting-Hinweisen.

## Connectors (Optional)

| Connector | Was er hinzufügt |
|-----------|-----------------|
| **~~sheets** | Aktivitätsdaten direkt laden; fertiges Script mit echten Sheet-IDs befüllen |
| **~~drive** | Baustein direkt in Google Drive ablegen |
| **~~docs** | Anleitung als Google Doc erstellen |

> **Keine Connectors?** Vollständig funktionsfähig — du bekommst Code und Anleitung zum Kopieren.

---

## Modus-Erkennung

### STANDALONE

```
Baustein: Code-Template mit Platzhaltern (DEINE_SHEET_ID_HIER etc.)
Anleitung: Schritt-für-Schritt für manuelle Installation
```

### SUPERCHARGED (~~sheets und/oder andere Connectors verfügbar)

```
Baustein: Code mit echten IDs aus context/profil.json befüllt
Deployment: Direkte Ausführung über MCP wenn möglich
Ablage: In Drive speichern via ~~drive
```

---

## Schritt 1: Aktivität und Format bestimmen

**Welche Aktivität?**
- Aus Konversation: Nutzer hat Aktivität oder "Baustein [Nummer]" aus Vorschlags-Engine genannt
- Aus `context/aktivitaeten.json`: Nach ID oder Name suchen
- Wenn unklar: "Welche Aktivität soll ich als Baustein erstellen?"

**Welches Delivery-Format?**
1. Bewertung aus `automatisierungs-bewertung` Skill lesen (falls vorhanden)
2. Andernfalls: Entscheidungsmatrix aus `references/entscheidungsmatrix.md` anwenden
3. Format bestätigen: "Ich erstelle das als [Format]. Passt das?"

## Schritt 2: Baustein generieren

Nutze die Templates aus `references/baustein-templates.md` für das jeweilige Format.

### Format A: Apps Script Code

Erstelle vollständigen, lauffähigen Code:

1. **CONFIG-Block** mit allen anpassbaren Werten (nie hartcodiert!)
   - SUPERCHARGED: Sheet-ID aus `context/profil.json` eintragen
   - STANDALONE: Platzhalter `DEINE_SHEET_ID_HIER` verwenden

2. **Hauptfunktion** mit dokumentierten Schritten:
   - Daten lesen
   - Verarbeitung (Logik spezifisch zur Aktivität)
   - Output (E-Mail, Sheet-Update, etc.)

3. **Trigger-Setup-Funktion** (`triggerErstellen()`) mit sinnvollem Default

4. **Kommentare** auf Deutsch, verständlich für Nicht-Entwickler

5. **Installations-Anleitung** (immer beifügen):
   ```
   ## Installations-Anleitung
   1. Google Apps Script öffnen: https://script.google.com
   2. Neues Projekt erstellen → Code einfügen
   3. CONFIG anpassen: [Liste was zu ändern ist]
   4. Einmalig ausführen: triggerErstellen()
   5. Testen: main() direkt ausführen
   ```

### Format B: Claude Skill ZIP

Erstelle SKILL.md mit:

1. **Frontmatter:** name, description (Third-Person + Trigger-Phrases)
2. **STANDALONE-Sektion:** Was Claude ohne MCP macht
3. **SUPERCHARGED-Sektion:** Was Claude mit MCP zusätzlich macht
4. **Output-Format:** Beschreibung des erwarteten Outputs

Anleitung für ZIP-Erstellung:
```
## Installation
1. Verzeichnis {skill-name}/ erstellen
2. SKILL.md hineinkopieren
3. zip -r {skill-name}.zip {skill-name}/
4. Im Claude Desktop Plugin-Einstellungen importieren
```

### Format C: Artifact-Template

Erstelle vollständiges HTML/CSS/JS Artifact:

1. KIO-Farbschema (#6B21A8 = Lila-Primärfarbe)
2. Header mit Titel, Stand, Plugin-Hinweis
3. Metriken-Grid für Kenndaten
4. Hauptinhalt (Tabelle, Chart, etc.) spezifisch zur Aktivität
5. SUPERCHARGED: Echte Daten aus Sheet einbinden

### Format D: Konfigurations-Anleitung

Erstelle Schritt-für-Schritt-Anleitung:

1. System und URL
2. Navigation zum richtigen Bereich
3. Konkrete Klick-Pfade und Einstellungswerte
4. Screenshot-Hilfen (Beschreibung was zu sehen ist)
5. Erwartetes Ergebnis
6. Troubleshooting-Tabelle

## Schritt 3: Baustein-Checkliste prüfen

Vor der Ausgabe sicherstellen:

- Delivery-Format entspricht der Entscheidungsmatrix-Empfehlung
- CONFIG-Abschnitt vorhanden (bei Apps Script)
- Installations-Anleitung vollständig
- Benutzerfreundliche Kommentare auf Deutsch
- Standalone-Variante funktioniert ohne MCP
- Geschätzte Setup-Zeit angegeben

## Schritt 4: Baustein ausgeben

```
# Baustein: [Aktivitätsname] automatisieren

**Format:** [Delivery-Format]
**Setup-Zeit:** [Schätzung]
**Plugin:** kio-aktivitaeten

---

[BAUSTEIN-INHALT]

---

## Nächster Schritt

[KONKRETER HINWEIS: "Führe triggerErstellen() aus" / "Kopiere den Code in Apps Script" / etc.]

Sage "Anleitung" wenn du Schritt für Schritt durchgeführt werden möchtest.
```

## Schritt 5: In Drive ablegen (SUPERCHARGED)

Falls ~~drive verfügbar:
```
~~drive upload "[aktivitaet]-baustein.[extension]" [baustein-inhalt]
→ "Ich habe den Baustein in deinem Drive abgelegt: [Link]"
```

## Regeln

- Baustein muss ohne Anpassung testbar sein (Platzhalter klar markiert)
- Keine Annahmen über externe Systeme außerhalb Google Workspace
- Bei externen System-Anforderungen: "Sprich mit deinem KIO-Berater über [System]"
- Code-Kommentare auf Deutsch
- Apps Script: Immer triggerErstellen() Funktion für einfaches Deployment
- Sprache: Deutsch
- Duze den User
