---
description: Top-5 Automatisierungsvorschläge mit Impact-Effort-Bewertung und passendem Delivery-Format
argument-hint: "<optionale Aktivität für gezielte Vorschläge>"
allowed-tools: ["Read", "Write"]
---

# /vorschlaege

> Wenn du unbekannte Platzhalter siehst oder prüfen möchtest welche Tools verbunden sind, schau in [CONNECTORS.md](../CONNECTORS.md).

Erhalte die Top-5 Automatisierungsvorschläge aus deiner Aktivitäts-Inventur — gerankt nach Impact/Effort-Verhältnis, mit Angabe des passenden Delivery-Formats und konkreten nächsten Schritten.

## Verwendung

```
/vorschlaege
```

Oder gezielt für eine Aktivität:

```
/vorschlaege Wochenbericht
```

---

## Wie es funktioniert

```
┌─────────────────────────────────────────────────────────────────┐
│                       /vorschlaege                               │
├─────────────────────────────────────────────────────────────────┤
│  STANDALONE (funktioniert immer)                                 │
│  ✓ Liest context/aktivitaeten.json und context/analyse.json     │
│  ✓ Bewertet jede Aktivität nach Automatisierbarkeit             │
│  ✓ Rankt nach Impact/Effort (Quick Wins zuerst)                 │
│  ✓ Schlägt passendes Delivery-Format vor                        │
│  ✓ Schreibt context/vorschlaege.json für /baustein              │
├─────────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (wenn Tools verbunden sind)                        │
│  + MCP-Capability-Matching: Welche Automatisierungen sind mit   │
│    deinen verbundenen Tools tatsächlich umsetzbar?              │
│  + Realistische Aufwandsschätzung statt generische Bewertung    │
│  + Vorschläge direkt auf deine verfügbare Technologie zugeschn. │
└─────────────────────────────────────────────────────────────────┘
```

---

## Bewertungs-Algorithmus

Für jede Aktivität prüfe ich:

### Impact (Was bringt die Automatisierung?)
- **Zeitersparnis**: Stunden/Woche × 52 Wochen
- **Energie-Entlastung**: Aktivitäten die Energie kosten, prioritär behandeln
- **Fehlerreduktion**: Repetitive manuelle Aufgaben mit Fehlerrisiko
- **Skalierbarkeit**: Aktivitäten die mit Wachstum überproportional wachsen

### Effort (Was kostet die Umsetzung?)
- **Technische Komplexität**: Wie viele Systeme? Gibt es APIs?
- **Datenverfügbarkeit**: Sind die Daten strukturiert und zugänglich?
- **Abhängigkeiten**: Brauche ich externe Freigaben oder Integrationen?

### Delivery-Format-Matching
| Situation | Format |
|-----------|--------|
| Google Workspace, keine MCP nötig | Apps Script |
| KI-gestützter Prozess, Claude Desktop | Claude Skill ZIP |
| Dashboard, Template, Visualisierung | Artifact |
| MCP-Server verfügbar und passend | Konfigurations-Anleitung |

---

## Output

```
Top-5 Automatisierungsvorschläge

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#1 Wochenbericht automatisieren
   Impact:  ████████████ Hoch  (2h/Woche → 10 Min, spart 93 h/Jahr)
   Effort:  ████         Mittel (Daten aus Sheets, Output nach Docs)
   Format:  Apps Script

   Warum: Wöchentliche Wiederholung, klares Muster, Daten aus Sheets
   Wie:   Script liest KPIs, formatiert Bericht, mailt ihn automatisch

   → /baustein Wochenbericht

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#2 Tages-Status-Update vereinfachen
   Impact:  ████████████ Hoch  (5h/Woche → 30 Min)
   Effort:  ██           Gering (nur Texteingabe + Template)
   Format:  Claude Skill ZIP

   Warum: Täglich, kostet viel Energie, klare Struktur
   Wie:   Skill fragt 3 Fragen, generiert strukturierten Update

   → /baustein Status-Update

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#3 Meeting-Protokoll-Vorlage
   Impact:  ████████     Mittel (1h/Woche → 10 Min)
   Effort:  ██           Gering (Template-basiert)
   Format:  Artifact

   Warum: Wiederkehrendes Format, einfach standardisierbar
   Wie:   Artifact mit ausfüllbarer Vorlage + Auto-Zusammenfassung

   → /baustein Meeting-Protokoll

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#4 CRM-Datenpflege
   Impact:  ████████     Mittel (3h/Woche → 30 Min)
   Effort:  ████████     Hoch   (CRM-API, Daten-Mapping)
   Format:  Konfigurations-Anleitung

   Warum: Zeitaufwändig und fehleranfällig
   Wie:   MCP-Server für CRM + Konfigurations-Anleitung

   → /baustein CRM-Datenpflege

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#5 E-Mail-Routing-Regeln
   Impact:  ████         Mittel (2h/Woche → 20 Min)
   Effort:  ██           Gering (Gmail-Filter)
   Format:  Apps Script

   Warum: Einfach zu implementieren, sofortiger Effekt
   Wie:   Gmail-Filter-Script + Labeling-Regeln

   → /baustein E-Mail-Routing

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Gesamtpotenzial: ~11h/Woche → ~2h/Woche = 9h/Woche gespart (468h/Jahr)

Nächster Schritt: /baustein [Name] um einen Vorschlag umzusetzen
```

---

## Gezielter Vorschlag

Mit `/vorschlaege Wochenbericht` bekomme ich:
- Tiefere Analyse dieser einen Aktivität
- Alle möglichen Automatisierungsansätze
- Konkrete Implementierungsoptionen mit Pros/Cons
- Direkte Weiterleitung zu `/baustein`

---

## Wenn Tools verbunden sind

**Beliebige MCP-Server verbunden:**
- Ich prüfe welche Ihrer verbundenen Tools Automatisierungen unterstützen
- Vorschläge werden auf verfügbare Capabilities zugeschnitten
- Keine Vorschläge für Tools die nicht verbunden sind (es sei denn du fragst explizit)

---

## Tipps

1. **Zuerst /inventur + /analyse** — Vorschläge basieren auf diesen Daten.
2. **Quick Wins zuerst** — Fange mit #1 an, das gibt schnell sichtbare Ergebnisse.
3. **Einen nach dem anderen** — Lieber einen Baustein vollständig umsetzen als fünf halbfertig.
