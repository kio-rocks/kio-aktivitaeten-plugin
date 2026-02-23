# Frage-Katalog: Aktivitäten-Erfassung

Strukturierte Fragen pro Aktivität für die Dialog-basierte Erfassung.

## Pflichtfelder (immer fragen)

### 1. Aktivität — Name

**Frage:** "Wie heißt diese Aktivität? (kurze Bezeichnung, z.B. 'Kunden-E-Mails beantworten')"

- Freitext, max. 60 Zeichen
- Soll als Spalte `Aktivität` in die CSV
- Falls unklar: "Beschreib mir kurz was du da machst"

---

### 2. Status — Rolle oder Notlösung?

**Frage:** "Machst du das, weil es zu deiner Rolle gehört — oder aus einem anderen Grund?"

**Antwort-Optionen (mit Erklärung anbieten wenn nötig):**

1. **"Gehört zu meiner Rolle"** — Das ist Kernarbeit, steht in deiner Stellenbeschreibung
2. **"Weil es sonst niemanden gibt"** — Du machst es, weil kein anderer da ist (nicht deine eigentliche Aufgabe)
3. **"Andere Lösung ist nötig"** — Du machst es, aber du weißt, es braucht eine bessere Lösung
4. **"Mein Team führt es aus"** — Du organisierst/delegierst, dein Team macht die Ausführung
5. **"Kein Prozess vorhanden"** — Niemand hat das Thema organisiert, du springst ein
6. **"Prozess funktioniert nicht"** — Es gibt einen Prozess, aber er klappt nicht richtig

**Merkhilfe für Claude:** Wenn User zögert, konkret nachfragen: "Würdest du es machen wenn du eine neue Stelle hättest?"

---

### 3. Energie — Energiegeber oder Energiesauger?

**Frage:** "Gibt dir das Energie oder kostet es dich Energie?"

**Antwort-Optionen:**
- **"Energiegeber"** — Du machst es gerne, es macht dir Spaß oder gibt dir Befriedigung
- **"Energiesauger"** — Es kostet dich Kraft, du machst es pflichtbewusst aber nicht gerne

**Nachfrage wenn unklar:** "Wenn du morgens aufwachst und weißt, du musst das heute machen — freust du dich oder nicht?"

---

### 4. Zeit — Wie viele Stunden?

**Frage:** "Wie viele Stunden verbringst du damit — pro [Frequenz]?"

- Zahlenwert (kann auch 0.5 für "halbe Stunde" sein)
- Erst Frequenz klären (Schritt 5), dann Zeit erfragen
- Falls unsicher: "Was schätzt du grob?"

---

### 5. Frequenz — Wie oft?

**Frage:** "Wie oft machst du das?"

**Antwort-Optionen:**
- pro Tag
- pro Woche
- pro Monat
- pro Quartal
- pro Jahr

**Nachfrage wenn "es kommt drauf an":** "Was ist die häufigste Situation — wählen wir die als Standard?"

---

### 6. Wert — Wirtschaftlicher Wert (optional)

**Frage:** "Hat diese Aktivität einen direkten wirtschaftlichen Wert? (z.B. '50 € pro Stunde' oder '200 € pro Vorgang')"

**Hinweis:** "Das ist optional. Wenn du keinen konkreten Wert kennst, einfach überspringen."

- Format: `[Zahl] € pro [Einheit]`
- Leer lassen ist OK

---

### 7. Quadrant — Können & Wollen

**Frage:** "Kannst du das gut — und magst du es?"

**Antwort-Matrix (4 Quadranten):**

| | Kann ich gut | Kann ich nicht so gut |
|---|---|---|
| **Mag ich** | "Liebe ich / großartig" | "Mag ich / lerne noch" |
| **Mag ich nicht** | "Mag ich nicht / gut" | "Mag ich nicht / schlecht" |

**Claude erklärt bei Bedarf:** "Das hilft uns zu verstehen, wo Automatisierung den größten Unterschied macht — besonders bei 'Mag ich nicht / gut' lohnt sich Automatisierung oft sehr."

---

## Reihenfolge-Empfehlung

Optimale Fragenreihenfolge für natürlichen Gesprächsfluss:

```
1. Aktivität (Name)
2. Status (Warum machst du das?)
3. Energie (Energiegeber/Sauger)
4. Frequenz (Wie oft?)
5. Zeit (Wie lange?)
6. Quadrant (Können & Wollen)
7. Wert (Optional, am Ende)
```

## Abkürzungen im Dialog

Bei schneller Erfassung reichen oft Kurzantworten:

- "Emails beantworten, Rolle, Sauger, täglich 2h, gut/mag nicht" → Claude mappt auf alle Felder
- "Meetings vorbereiten, Prozess fehlt, Geber, wöchentlich 3h" → Quadrant nachfragen

## Aktivitäts-ID

Automatisch vergeben: `{user-kürzel}-{laufende-nummer}`, z.B. `sk-001`, `sk-002`.
User-Kürzel aus `context/profil.json` lesen oder beim ersten Mal nachfragen.
