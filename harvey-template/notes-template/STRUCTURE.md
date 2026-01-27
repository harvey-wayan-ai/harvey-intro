# 📊 System Structure

Visual overview of your PARA knowledge management system.

---

## 🗂️ Folder Structure

```
notes/
│
├── 📖 README.md                    # System overview
├── 🚀 QUICK-START.md               # Get started in 5 minutes
├── 🔗 NOTION-INTEGRATION.md        # Connect to Notion
├── 📊 STRUCTURE.md                 # This file
│
├── 📅 daily/                       # Daily notes & journal
│   ├── TEMPLATE.md                 # Daily note template
│   ├── 2026-01-27.md              # Today's note
│   ├── 2026-01-28.md              # (created daily)
│   └── ...
│
├── 1-projects/                     # Active projects (temporary)
│   ├── README.md                   # Projects guide + template
│   ├── project-name.md            # Individual projects
│   └── ...
│
├── 2-areas/                        # Ongoing responsibilities
│   ├── README.md                   # Areas guide + template
│   ├── work-zuma.md               # Work at Zuma
│   ├── learning-ai.md             # AI & automation learning
│   ├── personal-life.md           # Health, habits, relationships
│   └── ...
│
├── 3-resources/                    # Reference materials
│   ├── README.md                   # Resources guide
│   ├── code-snippets.md           # Reusable code
│   ├── tools-stack.md             # Software & services
│   ├── ideas-backlog.md           # Future project ideas
│   └── ...
│
└── 4-archives/                     # Completed/inactive
    ├── README.md                   # Archive guide
    ├── 2024/
    ├── 2025/
    └── 2026/
        ├── projects/
        ├── work/
        └── personal/
```

---

## 🔄 Information Flow

```
┌─────────────────────────────────────────────┐
│  🧠 Your Brain (thoughts, ideas, tasks)     │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
         ┌─────────────────────┐
         │  📱 Quick Capture    │
         │  (Daily note/Harvey) │
         └──────────┬───────────┘
                    │
        ┌───────────┴───────────┐
        │                       │
        ▼                       ▼
┌──────────────┐        ┌──────────────┐
│ 📝 Daily Note│        │ 💬 Tell Harvey│
│ (Markdown)   │        │ (Telegram)    │
└──────┬───────┘        └──────┬────────┘
       │                       │
       └───────────┬───────────┘
                   │
                   ▼
         ┌─────────────────┐
         │ 📊 Weekly Review │
         │ (Process & Sort) │
         └─────────┬────────┘
                   │
       ┌───────────┼───────────┬───────────┐
       │           │           │           │
       ▼           ▼           ▼           ▼
┌──────────┐ ┌─────────┐ ┌──────────┐ ┌─────────┐
│ Projects │ │ Areas   │ │Resources │ │Archives │
│(deadlines)│ │(ongoing)│ │(reference)│ │  (old)  │
└────┬─────┘ └────┬────┘ └────┬─────┘ └────┬────┘
     │            │           │            │
     └────────────┴───────────┴────────────┘
                   │
                   ▼
           ┌──────────────┐
           │ 🔗 Notion DB │
           │ (Tasks/Proj) │
           └──────────────┘
```

---

## 📱 Access Points

### Local Files (Primary)
- **Path:** `/root/clawd/notes/`
- **Format:** Markdown
- **Benefit:** Fast, version control, grep searchable
- **Use for:** Writing, thinking, detailed notes

### Notion (Secondary)
- **Databases:** Projects, Tasks, Journal
- **Benefit:** Visual, collaborative, mobile-friendly
- **Use for:** Task tracking, project dashboard, quick updates

### Harvey (Interface)
- **Access:** Telegram
- **Commands:** Create, update, sync, search
- **Benefit:** Conversational, automated, smart
- **Use for:** Quick capture, automation, reminders

---

## 🎯 Decision Flow

### "Where should this go?"

```
New information arrives
        ↓
    Daily note? ────────────► YES → daily/YYYY-MM-DD.md
        ↓ NO
        ↓
Has deadline/goal? ─────────► YES → 1-projects/
        ↓ NO
        ↓
Ongoing responsibility? ────► YES → 2-areas/
        ↓ NO
        ↓
Reference/learning? ────────► YES → 3-resources/
        ↓ NO
        ↓
    Old/completed? ─────────► YES → 4-archives/
        ↓ NO
        ↓
    When in doubt ──────────────► daily/YYYY-MM-DD.md
```

---

## 🔧 Harvey Integration

### What Harvey Does

```
┌─────────────────────────────────────────────┐
│              Harvey Capabilities            │
├─────────────────────────────────────────────┤
│                                             │
│  📝 Note Management                         │
│    • Create daily notes                     │
│    • Update project files                   │
│    • Search across all notes                │
│    • Extract info from conversations        │
│                                             │
│  🔗 Notion Sync                             │
│    • Create projects in Notion              │
│    • Add/update tasks                       │
│    • Sync daily journal entries             │
│    • Generate summaries                     │
│                                             │
│  ⏰ Reminders & Tracking                    │
│    • Task deadline reminders                │
│    • Project progress updates               │
│    • Weekly review prompts                  │
│    • Daily note creation                    │
│                                             │
│  🤖 Smart Automation                        │
│    • Extract action items from chat         │
│    • Categorize notes automatically         │
│    • Generate weekly summaries              │
│    • Archive completed projects             │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 📈 System Evolution

### Phase 1: Setup (Week 1)
- [x] Create PARA structure
- [ ] Start using daily notes
- [ ] Setup Notion integration
- [ ] First weekly review

### Phase 2: Habit Building (Weeks 2-4)
- [ ] Daily notes become routine
- [ ] Weekly reviews consistent
- [ ] Projects actively tracked
- [ ] Harvey commands natural

### Phase 3: Optimization (Month 2+)
- [ ] Refine categories
- [ ] Automate repetitive tasks
- [ ] Customize templates
- [ ] Build personal workflows

---

## 💾 Backup Strategy

### Git Version Control
```bash
cd /root/clawd/notes
git init
git add .
git commit -m "Daily update"
git push
```

### Notion (Automatic)
- Projects & tasks auto-synced
- Notion's built-in version history

### Local Backup
- Files are text (markdown)
- Easy to backup anywhere
- Platform-independent

---

## 🎓 Resources

### Learn More
- **PARA Method:** Tiago Forte's "Building a Second Brain"
- **Markdown Guide:** [markdownguide.org](https://markdownguide.org)
- **Notion Docs:** [notion.so/help](https://notion.so/help)

### Within This System
1. Start: `QUICK-START.md`
2. Details: Each folder's `README.md`
3. Notion: `NOTION-INTEGRATION.md`
4. Ask Harvey: He knows everything!

---

**Created:** 2026-01-27
**System Version:** 1.0
**Last Updated:** 2026-01-27

*This is a living document. Update as your system evolves!*
