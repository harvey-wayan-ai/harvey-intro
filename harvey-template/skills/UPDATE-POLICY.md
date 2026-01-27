# 🔄 Skills Update Policy

## Auto-Update Rules

When Wayan says **"update skills"** or **"check for skill updates"**:

### 1. Check Official Repo
- URL: https://github.com/anthropics/skills
- Check for:
  - Updates to existing skills
  - New skills available
  - Version/timestamp changes

### 2. Handle Existing Skills

#### ✅ Auto-Update (Safe)
Update automatically if:
- Skill was downloaded from official repo
- **NO customizations** made (no `.custom` marker)
- No merge conflicts

#### ⚠️ Ask First (Custom Skills)
If skill is customized:
```
⚠️ Skill [name] has customizations!

Options:
A) Keep custom version (skip update)
B) Replace with official (lose customizations)
C) Show diff (compare changes)
D) Merge (try to combine both)

What do you want?
```

### 3. Report New Skills

When new skills appear in official repo:
```
📢 NEW SKILLS AVAILABLE:

- [skill-name-1] - Brief description
- [skill-name-2] - Brief description

Want to download any? (y/n/list for details)
```

---

## Tracking Customizations

### Mark Custom Skills
Create `.custom` file in skill folder:
```bash
echo "Customized on YYYY-MM-DD: [reason]" > skills/skill-name/.custom
```

### Check Before Update
```bash
if [ -f "skills/skill-name/.custom" ]; then
    # Ask before updating
else
    # Safe to auto-update
fi
```

---

## Update Commands

### Full Update Check
```
Harvey, update skills from Claude official
Harvey, check for skill updates
```

### Specific Skill
```
Harvey, update xlsx skill
Harvey, check if frontend-design has updates
```

### List Available Skills
```
Harvey, what new skills are available?
Harvey, show all skills in official repo
```

---

## Update Workflow

```
User: "update skills"
    ↓
Check official repo
    ↓
┌───────────────────────┐
│ Compare with local    │
├───────────────────────┤
│ • Modified dates      │
│ • File sizes          │
│ • Content hashes      │
└───────────┬───────────┘
            ↓
    ┌───────┴────────┐
    │                │
    ▼                ▼
[Updates]      [New Skills]
    │                │
    ├─ Custom? ──────┤
    │   ↓            │
    │  ASK           │
    │                │
    ├─ Not custom    │
    │   ↓            │
    │  AUTO-UPDATE   │
    │                │
    └────────┬───────┘
             ↓
    Report Summary:
    ✅ Updated: [list]
    ⏭️ Skipped: [custom]
    📢 New: [available]
```

---

## Current Skills Status

### Downloaded (2026-01-27)
- ⚠️ xlsx - **CUSTOMIZED** (Zuma branding + naming conventions)
- ✅ docx - Official (no customizations)
- ✅ frontend-design - Official (no customizations)
- ✅ mcp-builder - Official (no customizations)
- ✅ skill-creator - Official (no customizations)
- ✅ webapp-testing - Official (no customizations)

### Custom Skills
- **xlsx** (2026-01-27)
  - Customization: Zuma brand colors (#002A3A, #00E273)
  - Sheet naming: `clwdbt_[title]` convention
  - Quick reference: `skills/xlsx/ZUMA-REFERENCE.md`

---

## Safety Rules

1. **Never replace without asking** if `.custom` exists
2. **Always backup** before updates (git commit)
3. **Show diff** when conflicts detected
4. **Report summary** after update
5. **Test after update** (verify skill still works)

---

## Example Scenarios

### Scenario 1: Clean Update
```
Harvey: Checking official repo...
Harvey: ✅ xlsx updated (v1.2 → v1.3)
Harvey: ✅ docx updated (minor fixes)
Harvey: ✅ 2 skills updated, 2 unchanged
```

### Scenario 2: Custom Skill
```
Harvey: Checking official repo...
Harvey: ⚠️ xlsx has updates, but you customized it
Harvey: Want to: (A) Keep custom (B) Replace (C) Show diff?
You: C
Harvey: [shows changes]
```

### Scenario 3: New Skills
```
Harvey: Checking official repo...
Harvey: 📢 3 NEW SKILLS available:
- web-scraper - Extract data from websites
- email-composer - Professional email templates
- data-pipeline - ETL workflow automation

Download? (y/n/list for details)
```

---

**Created:** 2026-01-27
**Policy Owner:** Wayan
**Enforced by:** Harvey
