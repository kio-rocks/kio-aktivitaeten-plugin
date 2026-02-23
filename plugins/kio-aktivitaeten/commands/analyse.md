---
description: Aktivitäten analysieren — Dashboard mit 7 Dimensionen aus erfassten Daten oder CSV-Upload
argument-hint: "<CSV-Datei oder leer>"
allowed-tools: ["Read", "Write"]
---

# /analyse

> Wenn du unbekannte Platzhalter siehst oder prüfen möchtest welche Tools verbunden sind, schau in [CONNECTORS.md](../CONNECTORS.md).

Analysiere deine erfassten Aktivitäten und erhalte ein Dashboard mit 7 Dimensionen: Zeitverteilung, Energie-Bilanz, Frequenz-Matrix, Wert-Aufwand-Verhältnis, Automatisierungs-Kandidaten, Bottlenecks und Empfehlungen.

## Verwendung

```
/analyse
```

Oder mit CSV-Datei:

```
/analyse aktivitaeten.csv
```

---

## Wie es funktioniert

```
┌─────────────────────────────────────────────────────────────────┐
│                         /analyse                                 │
├─────────────────────────────────────────────────────────────────┤
│  STANDALONE (funktioniert immer)                                 │
│  ✓ Liest context/aktivitaeten.json (aus /inventur)              │
│  ✓ Oder: CSV-Upload mit Aktivitätsdaten                         │
│  ✓ Oder: Direkte Eingabe / Beschreibung der Aktivitäten         │
│  ✓ Dashboard mit 7 Dimensionen                                  │
│  ✓ Schreibt context/analyse.json für /vorschlaege               │
├─────────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (wenn Tools verbunden sind)                        │
│  + ~~sheets: Liest Aktivitätsdaten direkt aus Tabelle           │
│  + Automatische Aktualisierung ohne manuellen Export            │
│  + Schreibt Analyse-Ergebnis zurück in ~~sheets                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Was ich brauche

**Option A: Aktivitäten aus /inventur (empfohlen)**
Führe zuerst `/inventur` durch. Die Daten liegen dann in `context/aktivitaeten.json`.

**Option B: CSV hochladen**
Exportiere deine Aktivitäten als CSV. Mindest-Felder:
- Name der Aktivität
- Zeit pro Woche (in Minuten)
- Energie-Status (positiv / neutral / negativ)
- Frequenz (täglich / wöchentlich / monatlich)

Weitere hilfreiche Felder: Wert (hoch/mittel/niedrig), verwendete Systeme, Notizen.

**Option C: Aktivitäten beschreiben**
"Ich erstelle jeden Montag einen Bericht — das dauert 2 Stunden und kostet Energie. Außerdem führe ich täglich 3-4 kurze Kundengespräche die ich eigentlich mag..."

---

## Dashboard (7 Dimensionen)

### 1. Zeitverteilung

```
Wochenstunden nach Kategorie:

Berichte & Dokumentation  ████████████  12h  (30%)
Kundenkommunikation        ████████       8h  (20%)
Interne Meetings           ██████         6h  (15%)
Datenpflege                █████          5h  (13%)
Koordination               ████           4h  (10%)
Planung                    ███            3h   (7%)
Sonstiges                  ██             2h   (5%)
```

### 2. Energie-Bilanz

```
Energie-Verteilung deiner Wochenarbeitszeit:

🟢 Gibt Energie   ████████     8h  (20%)
🟡 Neutral        ████████████ 12h  (30%)
🔴 Kostet Energie ████████████████████ 20h  (50%)

⚠️  50% der Arbeitszeit kostet Energie — hohe Optimierungspotenzial!
```

### 3. Frequenz-Matrix

| Aktivität | Frequenz | Zeit/Woche | Energie |
|-----------|----------|------------|---------|
| Tages-Status Update | Täglich | 5h | Kostet |
| Wochenbericht | Wöchentlich | 2h | Kostet |
| Quartalsbericht | Monatlich | 0.5h | Neutral |

### 4. Wert-Aufwand-Verhältnis

```
Wert hoch, Aufwand niedrig  → Behalten ✅
Wert hoch, Aufwand hoch     → Optimieren 🚀
Wert niedrig, Aufwand hoch  → Automatisieren oder Eliminieren ⚡❌
Wert niedrig, Aufwand niedrig → Delegieren oder Eliminieren
```

### 5. Automatisierungs-Kandidaten (Top 5)

| # | Aktivität | Zeit/Woche | Potenzial | Format |
|---|-----------|------------|-----------|--------|
| 1 | Wochenbericht | 2h | Hoch | Apps Script |
| 2 | Status-Updates | 5h | Hoch | Claude Skill |
| 3 | Meeting-Protokolle | 1h | Mittel | Artifact |
| 4 | Datenpflege CRM | 3h | Mittel | Apps Script |
| 5 | E-Mail-Routing | 2h | Mittel | Regelwerk |

### 6. Bottlenecks

Aktivitäten die dich blockieren oder andere aufhalten:
- Warten auf Informationen von X → Automatisierungs-Kandidat
- Manuelle Datenübertragung → Direkt automatisierbar
- Suche nach Dateien → Struktur-Problem

### 7. Empfehlungen

Priorisierte Handlungsempfehlungen basierend auf Impact/Effort:
1. [Höchste Priorität] — Größte Zeitersparnis, kleiner Aufwand
2. [Zweite Priorität] — Hohe Energie-Entlastung
3. [Dritte Priorität] — Strategisch wichtig

---

## Nächste Schritte

Nach der Analyse:
- `/vorschlaege` — Top-5 Automatisierungsvorschläge mit Details
- `/baustein [Aktivität]` — Direkt einen Baustein für eine Aktivität erstellen

---

## Wenn Tools verbunden sind

**~~sheets verbunden:**
- Ich lese die Aktivitätsdaten direkt aus deiner Tabelle
- Kein CSV-Export nötig
- Ich schreibe das Analyse-Dashboard optional zurück in ein neues Tabellenblatt

---

## Tipps

1. **Zuerst /inventur** — Die Analyse ist nur so gut wie die Eingabe-Daten.
2. **Alle Aktivitäten einbeziehen** — Auch kleine, alltägliche Aufgaben zeigen im Aggregat oft überraschende Muster.
3. **Energie ehrlich einschätzen** — "Kostet Energie" ist ein Signal, kein Urteil.
