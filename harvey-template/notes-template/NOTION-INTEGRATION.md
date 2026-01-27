# 🔗 Notion Integration Guide

How to connect Harvey to your Notion workspace for project and task management.

---

## 📋 Prerequisites

- [ ] Notion account (personal or workspace)
- [ ] Harvey's Google Service Account email

**Service Account:** `harvey-access@harvey-wayan-ai.iam.gserviceaccount.com`

---

## 🚀 Setup Steps

### 1. Create Notion Databases

Create these databases in your Notion workspace:

#### **Projects Database**
Properties:
- **Name** (Title) - Project name
- **Status** (Select) - 🟢 Active / 🟡 On Hold / 🔴 Blocked / ✅ Complete
- **Priority** (Select) - High / Medium / Low
- **Start Date** (Date)
- **Target Date** (Date)
- **Progress** (Number, 0-100%)
- **Area** (Select) - Work / Learning / Personal / etc.
- **Tags** (Multi-select)
- **Notes** (Text) - Quick notes

#### **Tasks Database**
Properties:
- **Task** (Title) - Task description
- **Status** (Select) - ⬜ To Do / 🔄 In Progress / ✅ Done
- **Priority** (Select) - High / Medium / Low
- **Due Date** (Date)
- **Project** (Relation to Projects)
- **Area** (Select) - Work / Learning / Personal
- **Assignee** (Person) - You or Harvey
- **Notes** (Text)

#### **Daily Journal** (Optional)
Properties:
- **Date** (Title/Date)
- **Focus** (Text) - Top priorities
- **Mood** (Select) - ☀️ Great / ⛅ Good / 🌧️ Low
- **Energy** (Number, 1-10)
- **Wins** (Text)
- **Tomorrow** (Text)
- **Notes** (Text)

---

### 2. Share Databases with Harvey

For each database:

1. Click **"Share"** button (top right of database)
2. Click **"Invite"**
3. Enter Harvey's email:
   ```
   harvey-access@harvey-wayan-ai.iam.gserviceaccount.com
   ```
4. Set permission: **"Can edit"**
5. Click **"Invite"**

---

### 3. Get Database IDs

#### Method 1: From URL
1. Open database as a full page
2. Copy URL: `https://www.notion.so/[workspace]/[DATABASE_ID]?v=...`
3. Database ID is the 32-character string after workspace name

#### Method 2: Share Link
1. Click **"Share"** → **"Copy link"**
2. Extract database ID from URL

**Save these IDs:**
- Projects DB: `YOUR_PROJECTS_DB_ID`
- Tasks DB: `YOUR_TASKS_DB_ID`
- Journal DB: `YOUR_JOURNAL_DB_ID` (optional)

---

### 4. Configure Harvey

Tell Harvey your database IDs:

```markdown
Harvey, save these Notion database IDs:

**Projects:** YOUR_PROJECTS_DB_ID
**Tasks:** YOUR_TASKS_DB_ID
**Journal:** YOUR_JOURNAL_DB_ID
```

Harvey will store them securely and use them for automation.

---

## 🤖 What Harvey Can Do

### Project Management
- ✅ Create new projects from conversations
- ✅ Update project status and progress
- ✅ Move completed projects to archives
- ✅ Generate project summaries

### Task Management
- ✅ Create tasks with due dates
- ✅ Link tasks to projects
- ✅ Update task status
- ✅ Send reminders for overdue tasks
- ✅ Daily task summary

### Daily Journal
- ✅ Create daily journal entries
- ✅ Sync daily notes to Notion
- ✅ Track mood & energy patterns
- ✅ Weekly reflection summaries

---

## 💡 Example Commands

### Creating Projects
```
Harvey, create a project in Notion:
- Name: "Build Data Dashboard"
- Priority: High
- Start: Today
- Target: February 15
- Area: Work
```

### Creating Tasks
```
Harvey, add these tasks to Notion:
1. Review dashboard mockups (due tomorrow)
2. Write SQL queries for data (due Friday)
3. Test with sample data (next week)

Link them to "Build Data Dashboard" project.
```

### Daily Sync
```
Harvey, sync today's notes to Notion journal.
```

---

## 🔧 Troubleshooting

### "Permission denied" error
- ✅ Verify database is shared with Harvey's service account email
- ✅ Check permission is "Can edit" (not "Can view")
- ✅ Wait a few minutes after sharing (permissions can take time)

### "Database not found"
- ✅ Verify database ID is correct (32 characters)
- ✅ Ensure database is in shared workspace
- ✅ Try copying link again

### Harvey can't update
- ✅ Check Harvey has edit permissions
- ✅ Verify property names match expected format
- ✅ Database isn't locked or archived

---

## 📊 Best Practices

### Projects
- Create project when you have specific outcome + deadline
- Update status regularly (Harvey can help!)
- Move to archive when complete
- Link related tasks

### Tasks
- Break down projects into tasks
- Set realistic due dates
- Use priority for focus
- Let Harvey send reminders

### Daily Notes
- Fill in morning (focus) and evening (wins)
- Be honest about mood/energy (track patterns!)
- Harvey can pre-fill from daily markdown notes

---

## 🎯 Workflow Integration

```
Local Notes (PARA) ←→ Notion Databases
     ↓                      ↓
  Harvey syncs         Harvey manages
  daily files          projects & tasks
     ↓                      ↓
  Markdown files      Visual dashboard
  (backup, detail)    (tracking, quick view)
```

**Best of both worlds:**
- Markdown for writing & thinking
- Notion for tracking & collaboration
- Harvey keeps them in sync!

---

## 🔐 Security Note

Harvey uses Google Service Account for Notion access. Credentials are:
- Stored securely at `~/.google-credentials.json`
- Never shared or logged
- Restricted file permissions (600)
- Only Harvey can access

---

## ✅ Post-Setup Checklist

- [ ] Created Projects database in Notion
- [ ] Created Tasks database in Notion
- [ ] (Optional) Created Daily Journal database
- [ ] Shared all databases with Harvey's service account
- [ ] Saved database IDs
- [ ] Told Harvey the database IDs
- [ ] Tested creating a project
- [ ] Tested creating a task

**Ready to go!** 🚀

---

**Created:** 2026-01-27
**Need help?** Just ask Harvey!
