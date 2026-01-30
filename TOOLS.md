# TOOLS.md - Local Notes

Skills define *how* tools work. This file is for *your* specifics — the stuff that's unique to your setup.

## mgrep - Semantic Search (PREFERRED)

**Use mgrep instead of grep for finding code by meaning.**

```bash
# Find code by describing what you're looking for
mgrep "where is user authentication?"
mgrep "how does payment processing work?"

# Web search with summarized answer
mgrep --web --answer "how to use React Server Components"

# Limit results
mgrep -m 5 "error handling"
```

**When to use mgrep:** Exploring code, finding features, understanding intent
**When to use grep:** Exact string match, refactoring, regex patterns

**Cost Impact:** ~50% fewer tokens per search (vs trial-and-error grep)
**Status:** `mgrep watch` runs as systemd service - workspace auto-indexed

## Multi-Agent Delegation System

**Specialized sub-agents for efficient task delegation:**

```bash
# Deep reasoning & architecture decisions
clawdbot agent --agent oracle --message "analyze this complex problem"

# Quick codebase exploration  
clawdbot agent --agent explore --message "find all auth implementations"

# External documentation research
clawdbot agent --agent librarian --message "React 19 Server Components best practices"

# Fast simple tasks (typos, small fixes)
clawdbot agent --agent quick --message "fix this typo in line 42"
```

**Strategy:** Orchestrate rather than execute. Delegate specialized work to appropriate agents to save expensive Sonnet tokens for decision-making only.

## What Goes Here

Things like:
- Camera names and locations
- SSH hosts and aliases  
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras
- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH
- home-server → 192.168.1.100, user: admin

### TTS
- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.

## HuggingFace API (Image Generation)

**Token:** Stored at `/root/.huggingface-token` (not in git)
**Location:** `/root/.huggingface-token`
**Tier:** Free tier
**Purpose:** AI image generation (Hunyuan, Kolors, Flux)

**Available Models:**
- `Tencent-Hunyuan/HunyuanDiT` - Chinese aesthetic, text-to-image
- `Kwai-Kolors/Kolors` - Excellent for Asian faces/styles
- `black-forest-labs/FLUX.1-schnell` - Fast generation
- Other SDXL models

**Rate Limits (Free Tier):**
- Rate limited (few requests/hour)
- May queue during peak times
- Good enough for testing

**Usage:**
```python
from huggingface_hub import InferenceClient
client = InferenceClient(token=open('/root/.huggingface-token').read().strip())
image = client.text_to_image("prompt here", model="Tencent-Hunyuan/HunyuanDiT")
```

**Upgrade:** Pro tier $9/month for unlimited requests
