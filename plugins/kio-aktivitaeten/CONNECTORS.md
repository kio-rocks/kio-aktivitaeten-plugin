# Connectors

## How tool references work

Plugin files use `~~category` as a placeholder for whatever tool the user connects in that category. For example, `~~crm` might mean HubSpot, Salesforce, or any other CRM with an MCP server.

Plugins are **tool-agnostic** — they describe workflows in terms of categories (email, calendar, sheets, etc.) rather than specific products. The Cowork platform resolves these placeholders automatically based on the connectors the user has enabled.

## Connector-Modell

Dieses Plugin bringt **keine eigenen MCP-Server** mit. Stattdessen nutzt es die **Cowork-Plattform-Connectors** — dort hat der Kunde/IT granulare Kontrolle:

- **Welche Dienste** verbunden werden (nur Gmail, nur Calendar, etc.)
- **Welche Berechtigungen** gelten (read-only vs. write/delete)

### Empfohlener Start

Für die ersten Wochen reichen **zwei Connectors**:

1. **Gmail** — E-Mail-Aktivitäten erkennen und analysieren
2. **Calendar** — Termin-basierte Aktivitäten erfassen

Weitere Connectors nach Bedarf hinzufügen, wenn das Team bereit ist.

## Connectors for this plugin

| Category | Placeholder | Connector options |
|----------|-------------|-------------------|
| Email | `~~email` | Google Workspace (Gmail), Microsoft 365 (Outlook) |
| Calendar | `~~calendar` | Google Workspace (Calendar), Microsoft 365 (Calendar) |
| Sheets / Tabellen | `~~sheets` | Google Workspace (Sheets), Microsoft 365 (Excel) |
| Docs / Dokumente | `~~docs` | Google Workspace (Docs), Microsoft 365 (Word), Notion |
| Drive / Dateispeicher | `~~drive` | Google Workspace (Drive), OneDrive, Dropbox |
| CRM | `~~crm` | HubSpot, Pipedrive, Salesforce, Close |
| ERP | `~~erp` | SAP, Odoo, Business Central |
| Project Tracker | `~~project-tracker` | Linear, Asana, Jira, Monday |
| Chat | `~~chat` | Slack, Microsoft Teams, Discord |
| Tickets / Support | `~~tickets` | Zendesk, Freshdesk, HubSpot Service |
| Directory | `~~directory` | Google Workspace (Admin), Active Directory |
| HR-System | `~~hr` | Personio, HiBob, SAP HR |
