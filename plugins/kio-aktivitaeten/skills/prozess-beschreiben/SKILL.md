---
name: prozess-beschreiben
description: Beschreibt einen Prozess strukturiert durch geführte Fragen zu Trigger, Schritten, Systemen, Dauer und Output. Wird ausgelöst durch "Beschreibe Prozess [Name]", "Wie läuft [Aktivität] ab?" oder "/vorschlaege" mit Prozess-Kontext. Standalone ohne Tools, supercharged mit ~~sheets für automatischen Datenbankabgleich.
---

# Prozess beschreiben

Führt durch eine strukturierte Prozessaufnahme mit 7 Fragen. Niemals Schritte erfinden — nur aufschreiben was das Teammitglied sagt.

## Connectors (Optional)

| Connector | Was er hinzufügt |
|-----------|-----------------|
| **~~sheets** | Abgleich mit bestehenden Aktivitäten-Daten; Aktivitäts-ID aus Sheet |
| **~~docs** | Prozessbeschreibung direkt als Google Doc speichern |

> **Keine Connectors?** Vollständig funktionsfähig — Prozessbeschreibung wird als Markdown ausgegeben.

---

## Modus-Erkennung

### STANDALONE (keine Connectors)

```
Aktivität: In CSV/Context-Daten suchen oder direkt fragen
Output: Markdown-Block in der Konversation
```

### SUPERCHARGED (~~sheets und/oder ~~docs verfügbar)

```
Aktivität: Sheet nach Aktivitäts-ID durchsuchen
Output: Direkt in Google Doc speichern via ~~docs
```

---

## Schritt 1: Aktivität identifizieren

1. Identifiziere die genannte Aktivität (Spalte `Aktivität`) — siehe `references/csv-struktur.md`
2. Wenn ~~sheets verfügbar: Sheet nach der Aktivität durchsuchen, Aktivitäts-ID mitnotieren
3. Wenn die Aktivität nicht eindeutig ist, zeige mögliche Treffer und frage: "Welche Aktivität meinst du genau?"
4. Wenn keine Aktivität gefunden wird, frage: "Welche Aktivität möchtest du beschreiben?"

## Schritt 2: Strukturierte Fragen stellen

Stelle diese Fragen nacheinander. Warte jeweils auf die Antwort bevor du die nächste stellst:

1. **Trigger:** "Was löst diese Aktivität aus? (z.B. eine E-Mail kommt rein, ein Kunde ruft an, es ist Montag morgen)"
2. **Schritte:** "Beschreibe mir Schritt für Schritt was du machst. Fang einfach an — ich frage nach wenn ich mehr Details brauche."
3. **Systeme:** "Welche Systeme oder Tools nutzt du dabei? (z.B. Excel, E-Mail, ein bestimmtes Programm)"
4. **Dauer:** "Wie lange dauert es ungefähr vom Anfang bis zum Ende?"
5. **Output:** "Was ist das Ergebnis? Was kommt am Ende raus?"
6. **Empfänger:** "Wer bekommt das Ergebnis oder braucht es für seine Arbeit?"
7. **Fehlerfall:** "Was passiert wenn etwas schiefgeht? Gibt es typische Probleme?"

## Schritt 3: Output formatieren

Formatiere die Ergebnisse EXAKT so:

```
# Prozessbeschreibung: [Aktivitätsname]

**Wer:** [Name des Teammitglieds]
**ID:** [Aktivitäts-ID aus der CSV oder dem Sheet]

## Trigger
[Was den Prozess auslöst]

## Schritte
1. [Schritt 1]
2. [Schritt 2]
3. [Schritt N]

## Beteiligte Systeme
- [System 1]
- [System 2]

## Dauer
[Geschätzte Dauer]

## Output
[Was am Ende rauskommt]

## Empfänger
[Wer das Ergebnis bekommt]

## Fehlerfall
[Was bei Problemen passiert]
```

## Schritt 4: Speichern

### STANDALONE
Zeige das formatierte Markdown in der Konversation. Kein weiterer Schritt nötig.

### SUPERCHARGED (~~docs verfügbar)
```
Erstelle Google Doc: ~~docs create "Prozess: [Aktivitätsname]" [formatierter Inhalt]
Teile den Link: "Ich habe die Prozessbeschreibung als Google Doc gespeichert: [Link]"
```

## Regeln

- Stelle die Fragen in natürlicher Sprache, nicht als Formular
- Fasse dich kurz bei den Fragen — das Teammitglied soll reden, nicht du
- Wenn eine Antwort unklar ist, frage einmal nach — dann akzeptiere was du bekommst
- NIEMALS Schritte erfinden oder annehmen — nur aufschreiben was das Teammitglied sagt
- Sprache: Deutsch
- Duze das Teammitglied
