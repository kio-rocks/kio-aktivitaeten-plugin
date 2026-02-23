# Connectors

## How tool references work

Plugin files use `~~category` as a placeholder for whatever tool the user connects in that category. For example, `~~crm` might mean HubSpot, Salesforce, or any other CRM with an MCP server.

Plugins are **tool-agnostic** — they describe workflows in terms of categories (email, calendar, sheets, etc.) rather than specific products. The `.mcp.json` pre-configures specific MCP servers, but any MCP server in that category works.

## Connectors for this plugin

| Category | Placeholder | Included servers | Other options |
|----------|-------------|-----------------|---------------|
| Email | `~~email` | Google Workspace (Gmail) | Microsoft 365 (Outlook) |
| Calendar | `~~calendar` | Google Workspace (Calendar) | Microsoft 365 (Calendar) |
| Sheets / Tabellen | `~~sheets` | Google Workspace (Sheets) | Microsoft 365 (Excel) |
| Docs / Dokumente | `~~docs` | Google Workspace (Docs) | Microsoft 365 (Word), Notion |
| Drive / Dateispeicher | `~~drive` | Google Workspace (Drive) | OneDrive, Dropbox |
| CRM | `~~crm` | — | HubSpot, Pipedrive, Salesforce, Close |
| ERP | `~~erp` | — | SAP, Odoo, Business Central |
| Project Tracker | `~~project-tracker` | — | Linear, Asana, Jira, Monday |
| Chat | `~~chat` | — | Slack, Microsoft Teams, Discord |
| Tickets / Support | `~~tickets` | — | Zendesk, Freshdesk, HubSpot Service |
| Directory | `~~directory` | — | Google Workspace (Admin), Active Directory |
| HR-System | `~~hr` | — | Personio, HiBob, SAP HR |
