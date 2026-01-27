# 🎯 Harvey's Skills

Official Anthropic skills downloaded from https://github.com/anthropics/skills

**Downloaded:** 2026-01-27
**Last Updated:** 2026-01-27

---

## 📊 Installed Skills (6)

### 1. **xlsx** - Excel/Spreadsheet Mastery ⭐⭐⭐
**Path:** `skills/xlsx/`
**Purpose:** Professional spreadsheet creation, editing, and analysis

**Features:**
- ✅ Create spreadsheets with formulas & formatting
- ✅ Data analysis & visualization
- ✅ Preserve formulas when editing
- ✅ "Zero Formula Errors" principle
- ✅ Support: .xlsx, .xlsm, .csv, .tsv

**Files:**
- `SKILL.md` (288 lines) - Main skill guide
- `recalc.py` - Formula recalculation script

**Key Sections:**
- Requirements for outputs
- Formula handling best practices
- Formatting standards
- Data visualization guidelines

---

### 2. **docx** - Word Document Expert
**Path:** `skills/docx/`
**Purpose:** Professional document creation & editing

**Features:**
- ✅ Create/edit Word documents
- ✅ Tracked changes & comments
- ✅ Formatting preservation
- ✅ Text extraction & analysis

**Files:**
- `SKILL.md` (196 lines) - Main skill guide
- `docx-js.md` - JavaScript implementation details
- `ooxml.md` - Office Open XML reference

**Use Cases:**
- Reports, proposals, documentation
- Collaborative editing with tracked changes
- Professional formatting

---

### 3. **frontend-design** - Production Web UI
**Path:** `skills/frontend-design/`
**Purpose:** Create distinctive, production-grade frontend interfaces

**Features:**
- ✅ Avoid "generic AI aesthetics"
- ✅ React, Tailwind, modern web tech
- ✅ Landing pages, dashboards, components
- ✅ Exceptional attention to aesthetic details

**Files:**
- `SKILL.md` (42 lines) - Design philosophy & guidelines

**Use Cases:**
- Websites, landing pages
- Dashboards & data visualization
- React components
- Professional web UI

---

### 4. **mcp-builder** - MCP Server Development
**Path:** `skills/mcp-builder/`
**Purpose:** Build Model Context Protocol servers for LLM-external service integration

**Features:**
- ✅ Python (FastMCP) & Node/TypeScript (MCP SDK)
- ✅ Best practices & design patterns
- ✅ Tool design guidelines
- ✅ Evaluation framework

**Files:**
- `SKILL.md` (236 lines) - Main development guide
- `reference/` - Best practices & implementation guides
  - `mcp_best_practices.md`
  - `python_mcp_server.md`
  - `node_mcp_server.md`
  - `evaluation.md`
- `scripts/` - Evaluation & testing tools
  - `connections.py`
  - `evaluation.py`
  - `example_evaluation.xml`
  - `requirements.txt`

**Use Cases:**
- Integrate external APIs with LLMs
- Custom tool servers
- MCP protocol implementation

---

### 5. **skill-creator** - Build Custom Skills
**Path:** `skills/skill-creator/`
**Purpose:** Guide for creating effective custom skills

**Features:**
- ✅ Skill creation best practices
- ✅ Workflow patterns & templates
- ✅ Output patterns & validation
- ✅ Packaging & distribution

**Files:**
- `SKILL.md` (356 lines) - Main creation guide
- `references/` - Design patterns
  - `output-patterns.md`
  - `workflows.md`
- `scripts/` - Skill tooling
  - `init_skill.py` - Initialize new skill
  - `package_skill.py` - Package for distribution
  - `quick_validate.py` - Validate skill structure

**Use Cases:**
- Create custom skills for specialized tasks
- Learn skill design patterns
- Package skills for sharing

---

### 6. **webapp-testing** - Playwright Testing
**Path:** `skills/webapp-testing/`
**Purpose:** Test local web applications with Playwright

**Features:**
- ✅ Browser automation & testing
- ✅ Element discovery & interaction
- ✅ Screenshot capture
- ✅ Console log debugging

**Files:**
- `SKILL.md` (95 lines) - Testing guide
- `examples/` - Sample scripts
  - `console_logging.py`
  - `element_discovery.py`
  - `static_html_automation.py`
- `scripts/`
  - `with_server.py` - Test server helper

**Use Cases:**
- Test frontend functionality
- Debug UI behavior
- Automate browser interactions
- Verify web application state

---

## 🚀 How to Use

### Method 1: Direct Reference
Read the SKILL.md when needed:
```bash
cat skills/xlsx/SKILL.md
```

### Method 2: Tell Harvey
```
Harvey, use the xlsx skill to create a spreadsheet with...
Harvey, follow the docx skill to format this document...
Harvey, apply frontend-design principles to...
```

Harvey will automatically load and follow the skill guidelines.

### Method 3: Copy to Clawdbot Skills
```bash
# If Clawdbot has a skills directory, symlink or copy
ln -s /root/clawd/skills /root/.clawdbot/skills
```

---

## 📖 Learning Resources

### For xlsx (Spreadsheet Formatting):
- Zero formula errors principle
- Professional formatting standards
- Data visualization best practices
- Formula preservation techniques

### For docx (Documents):
- Tracked changes workflow
- Professional formatting
- OOXML structure understanding

### For frontend-design:
- Avoid generic AI aesthetics
- Creative design thinking
- Production-grade code quality

### For mcp-builder:
- MCP protocol understanding
- Tool design best practices
- Python FastMCP vs Node MCP SDK
- Evaluation framework

---

## 🔄 Update Skills

**Policy:** See `UPDATE-POLICY.md` for full details

**Quick command:**
```
Harvey, update skills from Claude official
Harvey, check for new skills
```

**What Harvey does:**
1. Check official repo for updates & new skills
2. Auto-update skills (if not customized)
3. Ask before replacing custom skills
4. Report what's new

**Manual update:**
```bash
cd /root/clawd/skills
# Re-download specific skill
curl -s "https://raw.githubusercontent.com/anthropics/skills/main/skills/xlsx/SKILL.md" -o xlsx/SKILL.md
```

---

## 📝 Notes

### Licenses
- **xlsx, docx:** Proprietary (Anthropic source-available)
- **frontend-design, mcp-builder:** Apache 2.0 (open source)

### Why These 6?
1. **xlsx** - Wayan needs better Excel formatting for data analysis
2. **docx** - Complement for reports & documentation
3. **frontend-design** - Web dashboards & data visualization
4. **mcp-builder** - Build custom integrations & tools
5. **skill-creator** - Create custom skills for specific workflows
6. **webapp-testing** - Test web applications & automation

---

## 🎯 Next Steps

1. **Study xlsx skill** - Main priority for analysis formatting
2. **Apply in practice** - Test on real data analysis tasks
3. **Refine workflows** - Customize based on Zuma's needs
4. **Explore MCP** - Build custom tools when needed

---

**Source:** https://github.com/anthropics/skills (55.2k ⭐)
**Maintained by:** Anthropic
**Last Updated:** 2026-01-27
