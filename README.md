# 🤖 Harvey - AI Assistant Setup Guide

**Clawdbot-based personal AI assistant with proactive capabilities, cost optimization, and VPS resource awareness.**

> This repository contains the complete setup structure for Harvey, a personal AI assistant built on Clawdbot. Use this as a template to create your own AI assistant!

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Sub-Agent Architecture](#-sub-agent-architecture)
- [Folder Structure](#folder-structure)
- [Setup Guide](#setup-guide)
- [Cost Optimization](#cost-optimization)
- [Resource Management](#resource-management)
- [Scripts](#scripts)
- [Skills](#skills)
- [Customization](#customization)

---

## 🎯 Overview

Harvey is a personal AI assistant that:
- **Proactively monitors** tasks, emails, calendar, and resources
- **Auto-switches** to cheaper AI models when usage hits 70%
- **Manages resources** on a 2vCPU/8GB RAM VPS efficiently
- **Integrates** with Gmail, Google Docs, Telegram, and more
- **Uses PARA method** for notes and knowledge management

**Base Platform:** [Clawdbot](https://github.com/clawdbot/clawdbot)  
**Primary Model:** Claude Sonnet 4.5 (with auto-fallback to DeepSeek V3, Grok Fast, MiniMax)  
**VPS Specs:** 2 vCPU, 8GB RAM, 100GB storage

---

## ✨ Features

### 1. **Cost Optimization**
- Auto-switch to cheaper models at 70% Claude usage
- Separate API keys for assistant vs coding tasks
- Token-efficient memory management
- Heartbeat-based periodic checks (no constant polling)

### 2. **Resource Awareness**
- VPS monitoring (CPU, RAM, disk)
- Automatic alerts when resources >80%
- Reply size limits for Telegram compatibility
- Context compression strategies

### 3. **Proactive Capabilities**
- Heartbeat system for periodic checks
- Email/calendar monitoring
- Cron jobs for scheduled tasks
- Auto-restart capability

### 4. **Knowledge Management**
- PARA method (Projects, Areas, Resources, Archives)
- Daily notes with automatic timestamps
- Long-term memory (MEMORY.md) vs daily logs
- Notion integration for syncing notes

### 5. **Multi-Integration**
- Gmail (read/send)
- Google Docs/Sheets
- Telegram (primary channel)
- GitHub (code management)
## 🤖 Sub-Agent Architecture

Harvey uses a **dual-layer architecture** for optimal performance and cost efficiency:

### Layer 1: Orchestrator (Harvey - Claude Sonnet 4.5)
**Role:** High-level reasoning, decision making, user interaction

- Understanding complex requests
- Orchestrating workflows  
- Quality control & review
- User communication

**Cost:** Premium (but minimal - orchestration only)

### Layer 2: Sub-Agents (OpenRouter Models)
**Role:** Execute heavy computational tasks in background

**Available Models:**
- `deepseek/deepseek-chat` (DeepSeek V3) - **Best for coding** (~$0.14/1M tokens)
- `meta-llama/llama-3.3-70b-instruct` (Llama 3.3) - Reasoning & research
- `minimax-ai/minimax-01` (MiniMax M2.1) - Cheapest option

**Cost Savings:** ~95% cheaper than using Claude for everything

### How It Works

**Traditional (inefficient):**
```
User: "Build a data processing script"
Harvey: [hangs for 30s while coding...]
Cost: ~$0.15 (Claude tokens)
```

**Harvey's Approach (efficient):**
```
User: "Build a data processing script"  
Harvey: "🤖 Spawning sub-agent (DeepSeek)..." [instant]
Sub-Agent: [works in background]
Sub-Agent: ✅ Complete! 
Harvey: "Done! /path/to/script.py"
Cost: ~$0.008 (95% savings)
```

### Automatic Delegation

**Sub-agents spawned automatically for:**
- ✅ Coding & scripting (>20 lines)
- ✅ Data processing & analysis
- ✅ Report generation  
- ✅ Web research
- ✅ Document creation
- ✅ Long-running operations

**Harvey handles directly:**
- ⚡ Quick responses (<5s)
- ⚡ Simple file operations
- ⚡ Conversations
- ⚡ Decision-making

### Sub-Agent Status Reporting

After each task, Harvey reports performance:

```
🤖 Sub-Agent Report:
Model: DeepSeek V3 (via OpenRouter)
Task: Stock monitoring script
Duration: 23.4s
Tokens: 1,245 in / 3,876 out
Cost: ~$0.0082
Status: ✅ Complete
Output: /root/clawd/scripts/stock-monitor.py
```

### Cost Impact

**Monthly estimates:**
- Harvey (orchestrator): ~$15-25/month
- Sub-agents (execution): ~$3-8/month  
- **Total: ~$18-33/month**

**vs Claude-only:** ~$200-300/month

**Savings: 85-90%** 💰

---

- Continue extension (for cheap coding)

---

## 📂 Folder Structure

```
/root/clawd/                          # Harvey's workspace
│
├── AGENTS.md                         # Core instructions (read first!)
├── SOUL.md                           # Personality & behavior guidelines
├── IDENTITY.md                       # Name, avatar, basic identity
├── HEARTBEAT.md                      # Periodic tasks & checks
├── TOOLS.md                          # Local environment notes
├── CONTEXT.md                        # VPS specs & quick reference
├── USER.md                           # [PRIVATE] User info (not shared)
├── MEMORY.md                         # [PRIVATE] Long-term memory
├── OPTIMIZATION-SUMMARY.md           # Cost & performance optimization strategies
│
├── scripts/                          # Utility scripts
│   ├── harvey-status.sh              # All-in-one status check (VPS + AI)
│   ├── check-resources.sh            # VPS resource monitoring
│   ├── restart-clawdbot.sh           # Self-restart script
│   └── sync-to-template.sh           # Sync changes to template
│
├── skills/                           # Claude official skills
│   ├── docx/                         # Word document handling
│   ├── xlsx/                         # Excel spreadsheet handling
│   ├── frontend-design/              # Web UI creation
│   ├── mcp-builder/                  # MCP server development
│   ├── skill-creator/                # Skill creation guide
│   └── webapp-testing/               # Playwright browser automation
│
├── google-oauth-setup/               # Google API integration
│   ├── README.md                     # Setup guide
│   └── examples/                     # Python examples
│
├── harvey-template/                  # Reusable template (safe to share)
│   ├── README.md                     # Template guide
│   ├── scripts/                      # Template scripts
│   ├── skills/                       # Skills documentation
│   ├── notes-template/               # PARA notes structure
│   ├── config-templates/             # Config examples (no credentials)
│   └── docs/                         # Additional documentation
│
├── notes/                            # [PRIVATE] PARA notes (not shared)
│   ├── 1-projects/                   # Active projects
│   ├── 2-areas/                      # Ongoing responsibilities
│   ├── 3-resources/                  # Reference material
│   ├── 4-archives/                   # Completed/inactive items
│   └── daily/                        # Daily logs (YYYY-MM-DD.md)
│
├── memory/                           # [PRIVATE] Daily memory logs (not shared)
│   └── YYYY-MM-DD.md                 # Daily logs
│
├── harvey-projects/                  # Development projects
│   ├── harvey-intro/                 # This repo (public setup guide)
│   ├── demo-project/                 # Example project
│   └── google-integration/           # Google services integration
│
└── mcp-servers/                      # Model Context Protocol servers
    └── [MCP server implementations]
```

### 🔐 Privacy Notes

**Files NOT included in this repo (private/sensitive):**
- `USER.md` — User personal information
- `MEMORY.md` — Long-term memory
- `memory/` — Daily logs
- `notes/` — PARA personal notes
- `.google-credentials.json` — Google API credentials
- `.github-token` — GitHub access token
- Any files with API keys, passwords, or personal data

**This repo contains:**
- ✅ Template files (AGENTS.md, SOUL.md, etc.) — safe examples
- ✅ Scripts (status check, restart, monitoring)
- ✅ Documentation (optimization guides, setup instructions)
- ✅ Skills (official Claude skills documentation)
- ✅ Config templates (without real credentials)

---

## 🚀 Setup Guide

### Prerequisites

1. **VPS/Server:** 2+ vCPU, 8+ GB RAM recommended
2. **Clawdbot installed:** Follow [official docs](https://docs.clawd.bot)
3. **API Keys:**
   - Anthropic (Claude)
   - OpenRouter (for fallback models)
   - Google Cloud (optional, for Gmail/Docs)
4. **Telegram Bot Token** (or other messaging platform)

### Installation Steps

#### 1. Install Clawdbot
```bash
# Install Clawdbot globally
npm install -g clawdbot

# Initialize workspace
mkdir -p ~/clawd && cd ~/clawd
```

#### 2. Clone This Template
```bash
cd ~/clawd
git clone https://github.com/harvey-wayan-ai/harvey-intro.git
cp -r harvey-intro/harvey-template/* .
```

#### 3. Configure Core Files

**Copy and customize template files:**
```bash
# Copy templates (if not already present)
cp AGENTS.md.template AGENTS.md
cp SOUL.md.template SOUL.md
cp IDENTITY.md.template IDENTITY.md
cp USER.md.template USER.md
cp TOOLS.md.template TOOLS.md
cp HEARTBEAT.md.template HEARTBEAT.md
```

**Edit each file:**
- `AGENTS.md` — Update VPS specs, priorities
- `SOUL.md` — Define personality
- `IDENTITY.md` — Set name, avatar, emoji
- `USER.md` — Add user info (timezone, email, preferences)
- `TOOLS.md` — Add local environment notes
- `HEARTBEAT.md` — Configure periodic checks

#### 4. Configure Clawdbot

```bash
# Get config
clawdbot gateway config.get > config.json

# Edit config.json:
# - Add Anthropic API key
# - Add OpenRouter API key (fallback)
# - Configure Telegram/messaging
# - Set workspace path: /root/clawd

# Apply config
clawdbot gateway config.apply --file config.json
```

#### 5. Set Up Scripts

```bash
# Make scripts executable
chmod +x scripts/*.sh
chmod +x restart-clawdbot.sh

# Test status check
./scripts/harvey-status.sh
```

#### 6. Start Clawdbot

```bash
# Start daemon
clawdbot gateway start

# Check status
clawdbot gateway status
```

#### 7. Test Your Assistant

Send a message via Telegram (or your configured channel):
```
Hi Harvey, what's your status?
```

Harvey should respond with VPS + AI model info.

---

## 💰 Cost Optimization

### Auto-Switch Strategy

**How it works:**
1. Monitor Claude API usage via `session_status` tool
2. When usage hits **70%**, auto-switch to cheaper fallback model
3. Notify user with clear alert
4. Fallback priority: DeepSeek V3 → Grok Fast → MiniMax M2.1

**Cost comparison:**
- Claude Sonnet 4.5: ~$3-15/million tokens
- DeepSeek V3: ~$0.27/million tokens (95% cheaper)
- MiniMax M2.1: ~$0.15/million tokens (98% cheaper)

**Implementation:**
See `HEARTBEAT.md` — auto-switch check runs during heartbeat polls.

### Separate API Keys for Coding

**Why:** Coding tasks burn tokens fast. Use cheap models for coding, save Claude for high-level thinking.

**Setup:**
- **Clawdbot/LLM Fallback:** Main OpenRouter key (for Harvey fallbacks)
- **VibeCoding/Continue:** Separate OpenRouter key (for coding in VS Code)
- **Benefit:** Separate cost tracking on OpenRouter dashboard

**Continue Extension Config:**
```json
{
  "models": [
    {
      "title": "MiniMax M2.1",
      "provider": "openrouter",
      "model": "minimax/minimax-01",
      "apiKey": "sk-or-v1-[VIBECODING-KEY]"
    }
  ]
}
```

### Token-Efficient Memory Management

**Strategy:**
- **Daily logs** (`memory/YYYY-MM-DD.md`) — raw, detailed
- **Long-term memory** (`MEMORY.md`) — curated, distilled
- **Load policy:**
  - Main session: Load MEMORY.md + today + yesterday
  - Group chats: Load only today's log (skip MEMORY.md for privacy)

**Compression:**
- Use bullet lists instead of tables on Telegram/Discord
- Paginate long outputs (max 20 items)
- Offload long content to Google Docs + share link

---

## 📊 Resource Management

### VPS Monitoring

**Script:** `scripts/check-resources.sh`

**What it checks:**
- CPU usage (target: <70%)
- RAM usage (target: <80%)
- Disk usage (target: <80%)

**Auto-alert:** Configured in `HEARTBEAT.md` to check every ~2 hours during active hours.

**Alert format:**
```
⚠️ **VPS RESOURCE ALERT**
CPU: 85% (2 vCPU)
RAM: 6.8GB/8GB (85%)
Disk: 65GB/100GB (65%)

Action needed: Check running processes
```

### Reply Size Limits

**Telegram limit:** 4096 characters  
**Harvey default:** <2000 characters (comfortable margin)

**For long content:**
- Create Google Doc → share link
- Email to user → link in Telegram
- Use file attachments

**Platform formatting:**
- **Discord/WhatsApp:** No markdown tables! Use bullet lists
- **Discord links:** Wrap in `<>` to suppress embeds: `<https://example.com>`
- **WhatsApp:** No headers — use **bold** or CAPS

### Context Size Management

**Target:** <120k tokens per session

**Strategies:**
- Load only recent memory files (today + yesterday)
- Use `memory_search` tool to find specific info (instead of loading all)
- Compress long outputs
- Summarize old conversations
- Archive completed projects

---

## 🛠️ Scripts

### 1. `harvey-status.sh` — All-in-One Status Check

**Location:** `scripts/harvey-status.sh`

**What it shows:**
- CPU/RAM/Disk usage with status indicators
- Clawdbot service status
- Current AI model (primary + fallbacks)
- Timestamp

**Usage:**
```bash
~/clawd/scripts/harvey-status.sh
```

**Trigger phrases (Harvey auto-runs this):**
- "Cek statusmu Harvey"
- "Harvey status"
- "Show me your status"

**Output example:**
```
🤖 Harvey Status Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 VPS Resources (2vCPU, 8GB RAM):
   CPU: 25% ✅
   RAM: 4.2GB / 8GB (53%) ✅
   Disk: 45GB / 100GB (45%) ✅

🔧 Clawdbot Service:
   Status: ● active (running)

🧠 AI Model:
   Primary: Claude Sonnet 4.5
   Fallback: DeepSeek V3 → Grok Fast → MiniMax

⏰ Checked at: 2025-01-28 10:30:45 UTC
```

### 2. `check-resources.sh` — VPS Resource Monitoring

**Location:** `scripts/check-resources.sh`

**What it checks:**
- CPU usage percentage
- RAM usage (used/total)
- Disk usage (used/total)

**Usage:**
```bash
~/clawd/scripts/check-resources.sh
```

**Output:** JSON-friendly or human-readable format.

**Integration:** Called by `HEARTBEAT.md` every ~2 hours to auto-alert on high usage.

### 3. `restart-clawdbot.sh` — Self-Restart Script

**Location:** `/root/clawd/restart-clawdbot.sh`

**What it does:**
1. Stop Clawdbot daemon
2. Wait 3 seconds
3. Start daemon again
4. Verify it's running
5. Auto-ping Telegram when ready

**Usage:**
```bash
~/clawd/restart-clawdbot.sh
```

**Or tell Harvey:**
- "Harvey, restart yourself"
- "Restart Clawdbot"

**Reliable:** Guaranteed to work. Harvey can run this autonomously when instructed.

---

## 🎓 Skills

Harvey uses **Claude Official Skills** for specialized tasks.

**Installed Skills:**
- **docx** — Word document handling (create, edit, track changes)
- **xlsx** — Excel spreadsheet handling (formulas, data analysis)
- **frontend-design** — Web UI creation (polished, creative)
- **mcp-builder** — MCP server development (FastMCP, MCP SDK)
- **skill-creator** — Guide for creating new skills
- **webapp-testing** — Playwright browser automation

**Location:** `/root/clawd/skills/`

**Update Skills:**
```bash
# Harvey can auto-update skills
# Just say: "Harvey, update skills from Claude official"
```

**Policy:** See `skills/UPDATE-POLICY.md`
- Auto-update if not customized
- Ask before replacing custom skills
- Report new skills available

**Skill Documentation:**
Each skill has a `SKILL.md` with:
- Description
- Tools available
- Workflows
- Examples
- Best practices

---

## 🎨 Customization

### 1. **Change Personality (SOUL.md)**

Edit `SOUL.md` to change:
- Tone (professional, casual, witty, etc.)
- Response style (concise, detailed, etc.)
- Boundaries (what to do/not do)
- Vibe (how to interact)

**Example:**
```markdown
# SOUL.md

Be concise and witty. Skip the formalities.
Have strong opinions. Be resourceful before asking.
You're a trusted assistant, not a chatbot.
```

### 2. **Add Proactive Tasks (HEARTBEAT.md)**

Edit `HEARTBEAT.md` to add periodic checks:
- Email monitoring
- Calendar reminders
- Weather checks
- News summaries
- Custom automation

**Example:**
```markdown
## Email Check (every 2h)
- Check Gmail inbox
- Alert if urgent emails (keywords: "urgent", "ASAP")
- Summarize top 3 unread

## Calendar Reminder (daily at 8am)
- Check events for today + tomorrow
- Send summary to Telegram
```

### 3. **Configure Local Tools (TOOLS.md)**

Add environment-specific notes:
- Camera names/locations
- SSH hosts
- Device nicknames
- Preferred voices for TTS
- Custom shortcuts

**Example:**
```markdown
### Cameras
- living-room → Main area, 180° wide
- front-door → Entrance, motion-triggered

### SSH
- home-server → 192.168.1.100, user: admin

### TTS
- Preferred voice: "Nova" (warm, British)
```

### 4. **Add Custom Scripts**

Create your own scripts in `scripts/`:
```bash
cd ~/clawd/scripts
nano my-custom-script.sh
chmod +x my-custom-script.sh
```

Harvey can discover and run new scripts automatically.

### 5. **Integrate New Services**

**Google Services:**
1. Follow `google-oauth-setup/README.md`
2. Get credentials → save to `~/.google-credentials.json`
3. Share docs/sheets with service account email

**Other APIs:**
1. Get API key
2. Store securely (not in Git!)
3. Create skill or add to `TOOLS.md`
4. Test with Harvey

---

## 🎯 Use Cases

### 1. **Personal Assistant**
- Monitor emails/calendar
- Set reminders
- Manage tasks
- Knowledge management

### 2. **Development Helper**
- GitHub integration
- Code via Continue extension (cheap AI)
- Auto-commit changes
- Project management

### 3. **Data Analysis**
- Excel/CSV handling
- Google Sheets integration
- Python scripting
- Data visualization

### 4. **Content Creation**
- Google Docs drafting
- Email composition
- Frontend design
- Document editing

### 5. **Automation**
- Cron jobs for scheduled tasks
- Proactive monitoring
- Resource alerts
- Auto-restart on issues

---

## 📚 Documentation

**Local Clawdbot Docs:** `/root/.local/share/pnpm/global/5/.pnpm/clawdbot@.../node_modules/clawdbot/docs`  
**Online Docs:** https://docs.clawd.bot  
**Source:** https://github.com/clawdbot/clawdbot  
**Community:** https://discord.com/invite/clawd  
**Find Skills:** https://clawdhub.com

**Key Docs to Read:**
- `docs/GETTING-STARTED.md` — Clawdbot basics
- `docs/CONFIG.md` — Configuration options
- `docs/SKILLS.md` — Skill system
- `docs/TOOLS.md` — Available tools
- `AGENTS.md` — Harvey's core instructions (read first!)

---

## ⚠️ Important Notes

1. **VPS Specs:** This setup is optimized for 2vCPU/8GB RAM. Adjust resource limits if your VPS differs.

2. **API Costs:** Monitor your Claude/OpenRouter usage. Auto-switch helps but doesn't eliminate costs.

3. **Security:** Never commit credentials to Git. Use environment variables or secure files (outside repo).

4. **Privacy:** `USER.md`, `MEMORY.md`, `notes/`, and `memory/` contain personal data. Keep them private!

5. **Customization Required:** This is a template. You MUST customize `AGENTS.md`, `SOUL.md`, `USER.md`, etc. for your use case.

6. **Clawdbot Updates:** Keep Clawdbot updated for latest features and security fixes:
   ```bash
   npm update -g clawdbot
   ```

---

## 🤝 Contributing

Found a bug? Have an improvement? Open an issue or PR!

**What to contribute:**
- Bug fixes
- Documentation improvements
- New scripts/utilities
- Optimization strategies
- Setup guides

**What NOT to include:**
- Personal data
- Credentials
- Private notes/memory

---

## 📝 License

This setup guide is provided as-is for educational/personal use. Clawdbot itself is licensed separately — see [Clawdbot repo](https://github.com/clawdbot/clawdbot).

---

## 🙏 Credits

- **Clawdbot** by [Clawdbot Team](https://github.com/clawdbot)
- **Harvey Setup** by Wayan ([@harvey-wayan-ai](https://github.com/harvey-wayan-ai))
- **Claude Official Skills** by Anthropic

---

## 📬 Contact

**GitHub:** [@harvey-wayan-ai](https://github.com/harvey-wayan-ai)  
**Repo:** [harvey-intro](https://github.com/harvey-wayan-ai/harvey-intro)

For Clawdbot support: https://discord.com/invite/clawd

---

## 🚀 Quick Start (TL;DR)

```bash
# 1. Install Clawdbot
npm install -g clawdbot

# 2. Clone this template
git clone https://github.com/harvey-wayan-ai/harvey-intro.git
cd harvey-intro

# 3. Copy template files to ~/clawd
cp -r harvey-template/* ~/clawd/
cd ~/clawd

# 4. Customize files
nano AGENTS.md      # Core instructions
nano SOUL.md        # Personality
nano USER.md        # User info
nano IDENTITY.md    # Name/avatar

# 5. Configure Clawdbot
clawdbot gateway config.get > config.json
nano config.json    # Add API keys, workspace path
clawdbot gateway config.apply --file config.json

# 6. Start!
clawdbot gateway start
clawdbot gateway status

# 7. Test via Telegram
# Send: "Hi Harvey, what's your status?"
```

Done! 🎉 Your AI assistant is ready.

---

**Happy automating! 🤖**
