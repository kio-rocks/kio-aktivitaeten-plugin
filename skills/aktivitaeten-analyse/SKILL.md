---
name: aktivitaeten-analyse
description: Erstellt ein Dashboard mit 7 Analyse-Dimensionen für die Aktivitäten eines Teammitglieds. Wird ausgelöst durch "Ich bin [Name]", "Analysiere meine Aktivitäten", "Zeig mir meine Analyse" oder "/analyse". Standalone mit CSV-Upload, supercharged mit ~~sheets Anbindung.
---

# Aktivitäten-Analyse

Erstellt ein vollständiges Analyse-Dashboard mit 7 Dimensionen. Niemals raten — alle Daten kommen aus der CSV oder den verbundenen Sheets.

## Connectors (Optional)

| Connector | Was er hinzufügt |
|-----------|-----------------|
| **~~sheets** | Direktes Lesen aus Google Sheets statt CSV-Upload |
| **~~drive** | Automatisches Speichern des Analyse-Reports |

> **Keine Connectors?** CSV-Upload funktioniert vollständig. Das Dashboard wird als Artifact ausgegeben.

---

## Modus-Erkennung

### STANDALONE (kein ~~sheets)

```
Datenquelle: CSV-Upload
Vorgehen:
1. Falls noch keine CSV vorhanden: "Bitte lade deine aktivitaeten.csv hoch."
2. CSV einlesen und parsen
3. Nach Name filtern (aus context/profil.json oder Nutzer-Aussage)
4. Dashboard-Artifact erstellen
```

### SUPERCHARGED (~~sheets verfügbar)

```
Datenquelle: Google Sheets via MCP
Vorgehen:
1. Sheet-ID aus context/profil.json lesen (Feld: sheets_id)
2. Falls nicht vorhanden: "Wie lautet die ID deines Aktivitäten-Sheets?"
3. Alle Zeilen einlesen: ~~sheets read [sheet_id] "Aktivitäten"
4. Nach Name filtern
5. Dashboard-Artifact erstellen
```

---

## Schritt 1: Daten laden

1. Filtere Daten nach `Wer == [Name]`
2. Wenn kein Name genannt wurde, frage: "Wie heißt du? Sag mir deinen Vornamen."
3. Wenn der Name nicht gefunden wird: "Ich finde keine Aktivitäten für [Name]. Die Namen in den Daten sind: [Liste der eindeutigen Wer-Werte]."
4. Lade alle Aktivitäten dieser Person mit allen Spalten

Die Spalten und Status-Kategorien sind in `references/csv-struktur.md` dokumentiert.

## Schritt 2: Zeitberechnung normalisieren

Für jede Aktivität berechne die **Wochenstunden** gemäß der Normalisierungstabelle in `references/csv-struktur.md`.

Berechne die **Gesamtzeit pro Woche** als Summe aller Wochenstunden.

## Schritt 3: Artifact erstellen

Erstelle ein **React-Artifact** mit folgendem Aufbau:

**Header:**
- Titel: "Aktivitäten-Analyse: [Name]"
- Gesamtzahl Aktivitäten und Gesamtzeit pro Woche

**A) 80/20 Zeitverteilung:**
- Tabelle: Alle Aktivitäten sortiert nach Wochenstunden (absteigend)
- Spalten: Aktivität, Wochenstunden, kumulierter %-Anteil, Wert
- Markiere die Aktivitäten die zusammen 80% der Zeit ausmachen mit einer Hintergrundfarbe
- Zeige: "[X] von [Y] Aktivitäten verbrauchen 80% deiner Zeit"
- Cross-Check: Markiere Zeitfresser mit niedrigem Wert rot

**B) Wert-Zeit-Matrix:**
- 2×2 Grid mit 4 Feldern:
  - Oben links: "Schützen" (Viel Zeit + Hoher Wert) — grün
  - Oben rechts: "Eliminieren" (Viel Zeit + Niedriger Wert) — rot
  - Unten links: "Hebel" (Wenig Zeit + Hoher Wert) — blau
  - Unten rechts: "Noise" (Wenig Zeit + Niedriger Wert) — grau
- Jedes Feld listet die zugehörigen Aktivitäten
- Trennlinie: Median der Wochenstunden und Median der Werte
- Unter jedem Feld eine konkrete Empfehlung

**C) Energie-Bilanz:**
- Balkendiagramm: Gesamte Wochenstunden aufgeteilt in Energiegeber (grün) vs. Energiesauger (rot)
- Prozentuale Verteilung
- Wenn >50% der Zeit in Energiesauger fließt: Alarmsignal mit rotem Banner "Achtung: Mehr als die Hälfte deiner Zeit fließt in Aktivitäten die dir Energie rauben"

**D) Rollen-Fit:**
- Horizontales Balkendiagramm: Wochenstunden pro Status-Kategorie
- Farben: "gehört zu meiner Rolle" = grün, alle anderen = orange/rot Abstufungen
- Zusammenfassung: "[X]% Kernarbeit vs. [Y]% Fremdarbeit"
- Kernarbeit = "Mache ich, gehört zu meiner Rolle"
- Fremdarbeit = alle anderen 5 Status-Kategorien zusammen

**E) Top Automatisierungs-Kandidaten:**
- Tabelle der Aktivitäten die ALLE drei Kriterien erfüllen: Energiesauger UND niedriger Wert UND hohe Frequenz (mindestens wöchentlich)
- Falls weniger als 3 Treffer: Lockere auf zwei Kriterien (Energiesauger UND hohe Frequenz)
- Sortiert nach Wochenstunden absteigend
- Spalten: Aktivität, Wochenstunden, geschätztes Zeitersparnis-Potenzial (= Wochenstunden × 0.7)
- Wenn keine Kandidaten: "Keine offensichtlichen Automatisierungs-Kandidaten gefunden"

**F) Prozess-Probleme:**
- Zwei Bereiche:
  - "Strukturlücken" — Aktivitäten mit Status "weil es keinen Prozess gibt", sortiert nach Wochenstunden
  - "Kaputte Prozesse" — Aktivitäten mit Status "weil der Prozess nicht funktioniert", sortiert nach Wochenstunden
- Gesamtzeit in beiden Kategorien als Summe
- Wenn Gesamtzeit > 0: "Du verbringst [X] Stunden pro Woche mit Aktivitäten, die durch bessere Prozesse gelöst werden könnten"
- Wenn keine Treffer: Sektion ausblenden

**G) Blinde Flecken:**
- Zwei Bereiche:
  - "Ungeklärte Verantwortlichkeit" — Aktivitäten mit Status "weil es sonst niemanden gibt" UND Energie = "Energiesauger"
  - "Bekannte Probleme ohne Lösung" — Aktivitäten mit Status "andere Lösung ist erforderlich" UND Wochenstunden > Median
- Wenn keine Treffer: Sektion ausblenden

**Styling:** Tailwind CSS. Farbschema: Grün für positiv/schützenswert, Rot für Alarm/eliminieren, Blau für Hebel/Potential, Grau für Noise/unwichtig. Klare Überschriften pro Sektion mit Trennlinien.

## Regeln

- Alle Daten kommen aus der CSV oder dem verbundenen Sheet — NIEMALS Aktivitäten erfinden
- Wenn eine Spalte leer ist, diese Aktivität in der betroffenen Analyse-Dimension überspringen (nicht raten)
- Frequenzen und Werte gemäß `references/csv-struktur.md` normalisieren und extrahieren
- Sprache: Deutsch
- Duze das Teammitglied in allen Empfehlungen
