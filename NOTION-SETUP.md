# Notion Integration Setup

**Status:** ✅ Connected  
**Date:** 2026-01-28  
**Integration Name:** Harvey Bot

## Setup Complete

### 1. API Key Stored
- Location: `~/.config/notion/api_key`
- Token: `ntn_o32222330686N4Tm508GgtXN3p8mq8ifzb6PY1yKtgdc8J`
- Status: ✅ Verified working

### 2. Skills Installed
- **notion-knowledge-capture** - Convert conversations into structured Notion pages
- Location: `/root/clawd/skills/notion-knowledge-capture.md`
- Capabilities:
  - Decision logging
  - How-to guides
  - FAQ creation
  - Wiki entries
  - Learning notes
  - Documentation

### 3. Helper Script
- **notion-api.sh** - CLI tool for Notion API
- Location: `/root/clawd/skills/notion-api.sh`
- Usage:
  ```bash
  ./notion-api.sh search "query"
  ./notion-api.sh list
  ./notion-api.sh get-page <page_id>
  ./notion-api.sh get-database <db_id>
  ./notion-api.sh query-database <db_id>
  ```

## Next Steps (User Action Required!)

### 🔑 Share Pages with Integration

**CRITICAL:** Integration works but has no access yet. You need to:

1. Open your Notion workspace
2. Go to page/database you want Harvey to access
3. Click **"⋮" (three dots)** → **"Connections"** → **"Connect to"**
4. Select **"Harvey Bot"** (or your integration name)
5. Confirm

**Recommended to share:**
- [ ] Personal Tasks database
- [ ] Project Notes
- [ ] Decision Log
- [ ] Learning/Knowledge Base
- [ ] Work documentation

### Test Connection

After sharing pages, test with:
```bash
cd /root/clawd/skills
./notion-api.sh list
```

Should show your shared pages/databases!

## Usage Examples

### Search for Tasks
```bash
./notion-api.sh search "tasks"
```

### List All Accessible Pages
```bash
./notion-api.sh list | jq '.results[] | {id: .id, title: .properties.Name.title[0].plain_text, type: .object}'
```

### Query Database
```bash
# Get database ID from list command first
./notion-api.sh query-database <database_id> | jq '.results[] | .properties'
```

## Notion Skill Features

Harvey can now:
- ✅ Create structured pages from conversations
- ✅ Convert decisions into decision logs
- ✅ Generate how-to guides
- ✅ Build FAQ pages
- ✅ Capture meeting notes
- ✅ Link related content
- ✅ Tag and organize automatically

## API Reference

**Base URL:** `https://api.notion.com/v1/`  
**Version:** `2022-06-28`  
**Auth:** Bearer token in Authorization header

**Common Endpoints:**
- `POST /search` - Search pages/databases
- `GET /pages/{id}` - Get page
- `GET /databases/{id}` - Get database
- `POST /databases/{id}/query` - Query database
- `POST /pages` - Create page
- `PATCH /pages/{id}` - Update page

**Rate Limit:** ~3 requests/second average

## Troubleshooting

**Empty results when listing?**
- Make sure you've shared pages with the integration
- Check integration has correct permissions
- Verify token is correct

**Permission denied?**
- Integration needs to be connected to specific pages
- Can't access pages in different workspace

**API errors?**
- Check Notion-Version header matches
- Verify request format
- See: https://developers.notion.com/reference

## Documentation

- Notion API: https://developers.notion.com
- Harvey Skill: `/root/clawd/skills/notion-knowledge-capture.md`
- Integration Settings: https://notion.so/my-integrations

---

**Next Task:** Share Notion pages with Harvey Bot integration!
