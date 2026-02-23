---
name: wochen-review
description: Erstellt einen strukturierten Wochenbericht: Aktivitäten erfasst, Analyse gestartet, Automatisierungen umgesetzt, nächster Schritt. Wird ausgelöst durch "Wie läuft's?", "Wochen-Update", "Fortschritt", "Was haben wir diese Woche gemacht?" oder "/status". Standalone mit lokalem Kontext, supercharged mit ~~sheets für Live-Metriken.
---

# Wochen-Review

Strukturierter Wochenbericht in unter 2 Minuten. Zeigt was passiert ist, was ansteht und einen konkreten nächsten Schritt.

## Connectors (Optional)

| Connector | Was er hinzufügt |
|-----------|-----------------|
| **~~sheets** | Metriken direkt aus dem Aktivitäten-Sheet laden |
| **~~email** | Wochenbericht automatisch als E-Mail versenden |
| **~~calendar** | Nächsten Review-Termin direkt einplanen |

> **Keine Connectors?** Vollständig funktionsfähig mit den lokalen `context/`-Dateien.

---

## Modus-Erkennung

### STANDALONE

```
Datenquelle: context/aktivitaeten.json + context/profil.json + context/fortschritt.json
Ausgabe: Formatierter Bericht in der Konversation
```

### SUPERCHARGED (~~sheets verfügbar)

```
Datenquelle: Google Sheets für Aktivitätsdaten + lokale Context-Dateien
~~sheets read [sheet_id] "Aktivitäten"
Ausgabe: Bericht mit Live-Metriken + optionaler E-Mail-Versand
```

---

## Schritt 1: Daten sammeln

Lese alle verfügbaren Daten:

**Aus `context/aktivitaeten.json` (STANDALONE):**
- Anzahl erfasster Aktivitäten gesamt
- Davon diese Woche neu hinzugefügt (Feld: erfasst_am, aktuelles Datum - 7 Tage)
- Verteilung: Energiegeber vs. Energiesauger
- Verteilung: Kernrolle vs. Fremdarbeit

**Aus Sheet (SUPERCHARGED):**
- Dieselben Metriken aus dem Google Sheet
- Timestamp der letzten Änderung

**Aus `context/profil.json`:**
- Name des Users

**Aus `context/fortschritt.json` (falls vorhanden):**
- Anzahl gestarteter Analysen
- Anzahl erstellter Vorschläge
- Anzahl umgesetzter Bausteine

## Schritt 2: Wochenbericht erstellen

Berechne für die aktuelle Woche (letzte 7 Tage):

**Metriken ermitteln:**
- Neu erfasste Aktivitäten: Aktivitäten mit `erfasst_am` in den letzten 7 Tagen
- Analyse-Sessions: Aus `context/fortschritt.json` lesen
- Vorschläge generiert: Aus `context/fortschritt.json` lesen
- Bausteine erstellt: Aus `context/fortschritt.json` lesen

**Wenn `context/fortschritt.json` nicht existiert:** Nur Aktivitätsdaten zeigen, anderen Felder als "0 (noch nicht getrackt)" markieren.

## Schritt 3: Nächster Schritt ermitteln

Logik für die Empfehlung:

```
Wenn aktivitaeten < 5:
  → "Starte die Inventur: /inventur"

Wenn aktivitaeten >= 5 UND noch keine Analyse:
  → "Starte die Analyse: /analyse"

Wenn analyse vorhanden UND noch keine Vorschläge:
  → "Hole dir Vorschläge: /vorschlaege"

Wenn vorschlaege vorhanden UND noch kein Baustein:
  → "Erstelle deinen ersten Baustein: /baustein"

Wenn baustein vorhanden:
  → "Starte die nächste Runde oder vertiefe mit /prozess-beschreiben"
```

## Schritt 4: Bericht ausgeben

```
# Wochen-Review: [Name]

**Woche:** [Datum von] – [Datum bis]

---

## Diese Woche

| Metrik | Wert |
|--------|------|
| Neue Aktivitäten erfasst | [X] |
| Analysen durchgeführt | [X] |
| Automatisierungs-Vorschläge | [X] |
| Bausteine erstellt | [X] |

## Stand gesamt

| Metrik | Wert |
|--------|------|
| Aktivitäten im System | [Gesamt] |
| davon Energiesauger | [X] ([%]) |
| davon Fremdarbeit | [X] ([%]) |
| Automatisierungspotenzial | [X] Kandidaten |

---

## Highlights

[1-2 Sätze was diese Woche besonders war, basierend auf den Daten.
Beispiel: "Du hast 3 neue Aktivitäten erfasst, darunter 2 Energiesauger mit hohem Automatisierungspotenzial."]

---

## Nächster Schritt

[KONKRETER VORSCHLAG basierend auf Logik aus Schritt 3]

```

## Schritt 5: Versenden (SUPERCHARGED)

Falls ~~email verfügbar und User möchte versenden:
```
"Soll ich den Bericht per E-Mail schicken? (An: [E-Mail aus context/profil.json])"
Falls ja: ~~email draft [bericht] → "Entwurf erstellt — prüfe deinen Gmail-Entwurf."
```

Falls ~~calendar verfügbar und User möchte nächsten Termin:
```
"Soll ich den nächsten Wochen-Review für [Datum + 7 Tage] im Kalender eintragen?"
Falls ja: ~~calendar create "Wochen-Review kio-aktivitaeten" [datum] 30min
```

## Regeln

- Immer einen konkreten Nächsten Schritt ausgeben — nie nur Rückblick ohne Vorwärts-Impuls
- Wenn keine Daten vorhanden: "Noch keine Daten. Starte mit `/inventur` um die erste Aktivität zu erfassen."
- Metriken auf ganze Zahlen runden
- Datum immer im deutschen Format: TT.MM.JJJJ
- Sprache: Deutsch
- Duze den User
