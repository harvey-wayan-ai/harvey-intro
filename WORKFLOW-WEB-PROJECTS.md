# Web Project Workflow - MANDATORY

**User instruction: "flownya harus selalu gitu ya"**

This is the STANDARD workflow for ALL website/webapp requests. NO EXCEPTIONS.

## 🔒 CRITICAL SECURITY RULE

**"project2ku rahasia" - User emphasis**

**PROJECTS ARE PRIVATE/SECRET!**
- ✅ Each project = SEPARATE GitHub repo
- ❌ **NEVER** put projects in harvey-intro
- ❌ **NEVER** mix projects with documentation
- **harvey-intro** = Documentation/structure ONLY (public)
- **Projects** = Separate private repos (contain client work/secrets)

**This is a SECURITY requirement. NO EXCEPTIONS.**

---

## 🔄 The Flow (ALWAYS Follow This)

### 1. Request Received
User: "Bikin website [description]"

### 2. Spawn Sub-Agents (Orchestrate)
- ✅ Use sub-agents for ALL coding/building
- ✅ Orchestrate as many sub-agents as needed
- ✅ Models: DeepSeek (code), Llama (reasoning), MiniMax (cheap)
- ❌ NEVER code directly with Claude

### 3. Save to harvey-projects/
- ✅ Create folder: `/root/clawd/harvey-projects/[project-name]/`
- ✅ ALL files go here
- ❌ NEVER save projects elsewhere

### 4. Create NEW GitHub Repo (CRITICAL!)
- ✅ Create separate repo: `[project-name]`
- ✅ **NEVER push to harvey-intro** (that's documentation ONLY!)
- ✅ Projects are PRIVATE - keep them separate
- ✅ Push to new repo: `git push origin main`

**⚠️ SECURITY:** Projects contain client work/secrets - MUST be in separate repos!

### 5. Enable GitHub Pages on NEW Repo
- ✅ Enable Pages on the project's own repo (NOT harvey-intro!)
- ✅ Verify deployment status
- ✅ Live URL: `https://harvey-wayan-ai.github.io/harvey-intro/harvey-projects/[project-name]/`

### 6. Summary Report (Telegram)
Send summary with:
- ✅ Project name & description
- ✅ Tech stack used
- ✅ Sub-agent performance report (model, duration, cost)
- ✅ GitHub repo link
- ✅ Live URL
- ✅ Local path
- ✅ Features implemented

---

## 📋 Summary Template

```
✅ [Project Name] Complete!

🤖 Sub-Agent Report:
Model: [DeepSeek V3 / Llama 3.3 / MiniMax]
Task: [description]
Duration: [X.X seconds]
Tokens: [X,XXX in / X,XXX out]
Cost: ~$[X.XXXX]
Status: ✅ Complete

📦 What's Built:
- [Feature 1]
- [Feature 2]
- [Feature 3]

🔗 Links:
📁 Local: /root/clawd/harvey-projects/[name]/
🐙 GitHub: https://github.com/harvey-wayan-ai/[name]
🌐 Live: https://harvey-wayan-ai.github.io/[name]/

🛠️ Tech Stack:
[HTML/CSS/JS or React/Next.js or whatever]

✨ Status: Live & ready to use!
```

---

## ⚠️ Critical Rules

1. **ALWAYS use sub-agents** - Never code directly
2. **ALWAYS save in harvey-projects/** - No exceptions
3. **ALWAYS push to main branch** - No new branches
4. **ALWAYS make it live** - Deploy to GitHub Pages
5. **ALWAYS send summary** - Report everything to Telegram

---

## Example Execution

**User:** "Bikin landing page untuk AI travel app"

**Harvey:**
1. "🤖 Spawning sub-agent (DeepSeek) for web development..."
2. [Sub-agent builds site]
3. [Save to harvey-projects/ai-travel-landing/]
4. [Push to GitHub]
5. [Verify live URL]
6. Send summary to Telegram ✅

**Total time:** ~2-5 minutes
**User gets:** Complete project, live URL, full report

---

**This workflow is MANDATORY. Always follow it. No shortcuts.**
