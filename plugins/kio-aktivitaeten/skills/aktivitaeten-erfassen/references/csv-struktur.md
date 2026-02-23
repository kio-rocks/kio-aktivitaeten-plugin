# CSV-Struktur: aktivitaeten.csv

## Spalten

| Spalte | Beschreibung |
|--------|-------------|
| ID | Eindeutige Aktivitäts-ID (z.B. `1-001`) |
| Wer | Name des Teammitglieds |
| Aktivität | Beschreibung der Aktivität |
| Status | Eine der 6 Kategorien (siehe unten) |
| Energie | "Energiegeber" oder "Energiesauger" |
| Anzahl Stunden | Zeitaufwand pro Frequenz-Einheit (Zahl) |
| Frequenz | z.B. "pro Woche", "pro Monat" |
| Wert | z.B. "10 € pro Stunde" |
| Quadrant | z.B. "Liebe ich / großartig", "Mag ich nicht / gut" |

## Status-Kategorien

Die 6 Status-Werte und ihre Bedeutung:

1. **"Mache ich, gehört zu meiner Rolle"** — Kernarbeit, die in deiner Stellenbeschreibung steht
2. **"Mache ich, weil es sonst niemanden gibt"** — Du machst es, weil sonst niemand da ist, nicht weil es zu dir gehört
3. **"Mache ich, andere Lösung ist erforderlich"** — Es gibt ein bekanntes Problem, aber noch keine Lösung
4. **"Mache ich, Ausführung durch mein Team"** — Du delegierst die Ausführung an dein Team
5. **"Mache ich, weil es keinen Prozess gibt"** — Niemand hat das Thema organisiert, es fehlt ein Prozess
6. **"Mache ich, weil der Prozess nicht funktioniert"** — Ein Prozess existiert, funktioniert aber nicht

## Frequenz-Normalisierung

Alle Frequenzen auf "pro Woche" normalisieren für Vergleichbarkeit:

| Frequenz in CSV | Umrechnung auf Wochenstunden |
|----------------|------------------------------|
| "pro Tag" | Anzahl Stunden × 5 |
| "pro Woche" | Anzahl Stunden × 1 |
| "pro Monat" | Anzahl Stunden ÷ 4 |
| "pro Quartal" | Anzahl Stunden ÷ 13 |
| "pro Jahr" | Anzahl Stunden ÷ 52 |

## Wert-Extraktion

Nur den numerischen Teil aus der Wert-Spalte extrahieren:

- "10 € pro Stunde" → `10`
- "50 € pro Vorgang" → `50`
- Leerer Wert → Aktivität in wertbezogenen Analysen überspringen
