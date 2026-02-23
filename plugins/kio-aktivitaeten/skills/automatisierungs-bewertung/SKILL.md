---
name: automatisierungs-bewertung
description: Bewertet eine einzelne Aktivität auf ihre Automatisierbarkeit und empfiehlt das passende Delivery-Format. Wird ausgelöst durch "Kann man das automatisieren?", "Ist das machbar?", "Was kostet das ungefähr?" oder wenn eine spezifische Aktivität bewertet werden soll. Standalone mit Analyse-Logik, supercharged mit ~~sheets für direkten Datenbankabgleich.
---

# Automatisierungs-Bewertung

Bewertet EINE Aktivität: Automatisierbarkeits-Score, Delivery-Format, Aufwand, Voraussetzungen. Direkt und konkret — kein "es kommt drauf an".

## Connectors (Optional)

| Connector | Was er hinzufügt |
|-----------|-----------------|
| **~~sheets** | Aktivitätsdaten direkt laden statt manuell eingeben |
| **~~calendar** | Kalender-basierte Aktivitäten automatisch erkennen |

> **Keine Connectors?** Vollständig funktionsfähig — bewerte jede beschriebene Aktivität.

---

## Modus-Erkennung

### STANDALONE

```
Aktivität: Aus Konversation oder context/aktivitaeten.json
Bewertung: Basierend auf Beschreibung + Entscheidungsmatrix
```

### SUPERCHARGED (~~sheets verfügbar)

```
Aktivität: Direkt aus Sheet laden via ID oder Name
Bewertung: Mit vollständigen Aktivitäts-Metadaten (Energie, Frequenz, etc.)
```

---

## Schritt 1: Aktivität identifizieren

Welche Aktivität soll bewertet werden?

- Aus Konversation: User hat Aktivitätsname oder -ID genannt
- Aus `context/aktivitaeten.json`: Nach ID oder Name suchen
- SUPERCHARGED: `~~sheets get [sheet_id]` nach ID/Name filtern
- Wenn unklar: "Welche Aktivität soll ich bewerten?"

Lade alle verfügbaren Daten zur Aktivität: Status, Energie, Frequenz, Zeit, Systeme.

## Schritt 2: Automatisierbarkeits-Score berechnen

Bewerte auf einer Skala von 1-10 anhand dieser Faktoren:

**Faktor 1: Wiederholbarkeit (max. 3 Punkte)**
- 3 Punkte: Immer gleiche Schritte, kein Urteilsvermögen nötig
- 2 Punkte: Meist gleich, gelegentliche Ausnahmen
- 1 Punkt: Variable Schritte, oft Entscheidungen nötig
- 0 Punkte: Jedes Mal anders, stark kontextabhängig

**Faktor 2: Systemanbindung (max. 3 Punkte)**
- 3 Punkte: Nur Google Workspace (direkt automatisierbar)
- 2 Punkte: Google Workspace + ein weiteres System
- 1 Punkt: Externe Systeme, aber mit API
- 0 Punkte: Keine Systemanbindung möglich (z.B. physische Tätigkeiten)

**Faktor 3: Datenstruktur (max. 2 Punkte)**
- 2 Punkte: Daten bereits strukturiert (Sheet, Formular)
- 1 Punkt: Halb-strukturiert (E-Mail mit Muster)
- 0 Punkte: Freitext, Papier, mündlich

**Faktor 4: Zeit-Impact (max. 2 Punkte)**
- 2 Punkte: Mehr als 2 Stunden pro Woche
- 1 Punkt: 30 Minuten bis 2 Stunden pro Woche
- 0 Punkte: Weniger als 30 Minuten pro Woche

**Gesamtscore:**
- 8-10: Hohe Automatisierbarkeit — Empfehlung sofort möglich
- 5-7: Mittlere Automatisierbarkeit — Mit Anpassungen realisierbar
- 1-4: Geringe Automatisierbarkeit — Aufwand hoch, Benefit niedrig

## Schritt 3: Delivery-Format bestimmen

Nutze `references/entscheidungsmatrix.md` Teil A + B für die Format-Entscheidung.

Antworten auf Kernfragen:

**Was soll automatisch passieren?**
→ Apps Script (Trigger-basiert)

**Was soll auf einen Blick sichtbar sein?**
→ Artifact (Snapshot) oder Apps Script Web App (Live)

**Was soll ich nur noch bestätigen müssen?**
→ Claude Skill

**Was braucht eine einmalige Konfiguration?**
→ Manuell in Workspace

**Bei SUPERCHARGED (MCP verfügbar):** Zusätzlich prüfen ob direktes MCP-Deployment möglich (Teil D der Entscheidungsmatrix).

## Schritt 4: Aufwand schätzen

| Delivery-Format | Standalone Aufwand | Supercharged Aufwand |
|----------------|-------------------|---------------------|
| Manuell in Workspace | 1-2h (Einrichtung) | 30 Min |
| Apps Script | 4-8h (Code + Test) | 2-4h |
| Artifact | 2-4h (Design + Daten) | 1-2h |
| Claude Skill | 1-3h (SKILL.md) | 1-3h |

## Schritt 5: Voraussetzungen prüfen

Was muss vorhanden sein damit die Automatisierung funktioniert?

- Zugriffsrechte auf benötigte Systeme
- Daten in strukturierter Form
- Technische Grundkenntnisse (für Apps Script: Google Workspace Admin-Zugang)
- Zeitinvestition für Einrichtung

**Blocker identifizieren:** Gibt es etwas das die Umsetzung aktuell verhindert?

## Schritt 6: Bewertungs-Report ausgeben

```
# Automatisierungs-Bewertung: [Aktivitätsname]

## Score: [X]/10 — [Hoch/Mittel/Gering]

### Warum dieser Score
| Faktor | Punkte | Begründung |
|--------|--------|------------|
| Wiederholbarkeit | [0-3] | [Begründung] |
| Systemanbindung | [0-3] | [Begründung] |
| Datenstruktur | [0-2] | [Begründung] |
| Zeit-Impact | [0-2] | [Begründung] |

## Empfohlenes Format: [Format]

**Warum:** [Ein Satz Begründung]

## Zeitersparnis-Potenzial
- Aktuell: [Stunden] h/Woche
- Nach Automatisierung: [geschätzte Restzeit] h/Woche
- Ersparnis: ~[Differenz × 0.7] h/Woche

## Aufwand für Umsetzung
- Einmalig: [Aufwand]
- Amortisation: Nach [Wochen] Wochen rentabel

## Voraussetzungen
- [Voraussetzung 1]
- [Voraussetzung 2]

## Nächster Schritt
[Konkreter Handlungsvorschlag: "Sage 'Bau mir das' um den Baustein zu generieren" oder "Spreche mit deinem KIO-Berater über [Blocker]"]
```

## Regeln

- Immer einen konkreten Score und Format-Empfehlung ausgeben — kein "es kommt drauf an"
- Wenn Aktivitätsdaten fehlen (keine Frequenz, keine Systeme): Nachfragen bevor Bewertung
- Bei Score < 4: Ehrlich kommunizieren dass Aufwand > Nutzen
- Bei externen Systemen außerhalb Google Workspace: "Sprich mit deinem KIO-Berater"
- Sprache: Deutsch
- Duze den User
