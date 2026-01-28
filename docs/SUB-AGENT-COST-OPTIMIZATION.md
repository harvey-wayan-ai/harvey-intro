# Sub-Agent Cost Optimization Guide

**Date:** 2026-01-28  
**Harvey Version:** Latest

## Problem
By default, sub-agents can spawn using expensive models (Sonnet, GPT-4), which burns through API credits quickly for background tasks.

## Solution
Configure Clawdbot to allow **only cheap models** for sub-agents while keeping premium models for the main session.

## Configuration

### 1. Add Cheap Models to Gateway Config

Update `~/.clawdbot/clawdbot.json`:

```json
{
  "agents": {
    "list": [
      {
        "id": "main",
        "default": true,
        "subagents": {
          "allowAgents": ["gpt4o-mini", "deepseek-v3", "grok-fast", "minimax"]
        }
      },
      {
        "id": "gpt4o-mini",
        "name": "GPT-4o Mini",
        "workspace": "/root/clawd",
        "model": "openrouter/openai/gpt-4o-mini"
      },
      {
        "id": "deepseek-v3",
        "name": "DeepSeek V3",
        "workspace": "/root/clawd",
        "model": "openrouter/deepseek/deepseek-chat"
      },
      {
        "id": "grok-fast",
        "name": "Grok Fast AI 4.1",
        "workspace": "/root/clawd",
        "model": "vercel-ai-gateway/xai/grok-4.1-fast-reasoning"
      },
      {
        "id": "minimax",
        "name": "MiniMax M2.1",
        "workspace": "/root/clawd",
        "model": "minimax-cn/MiniMax-M2.1"
      }
    ]
  }
}
```

### 2. Cost Comparison

| Model | Input (per M tokens) | Output (per M tokens) | Best For |
|-------|---------------------|----------------------|----------|
| **DeepSeek V3** | FREE | FREE | Default choice ✅ |
| **GPT-4o Mini** | $0.15 | $0.60 | Backup when DeepSeek down |
| **Grok Fast** | Varies | Varies | Specific use cases |
| **MiniMax** | Varies | Varies | Alternative option |
| ~~Sonnet 4.5~~ | $3 | $15 | **Main session only** ❌ |
| ~~Haiku~~ | $0.80 | $4.00 | Still too expensive for sub-agents |

### 3. Auto-Delegation Strategy

**Recommended Priority:**
1. **DeepSeek V3** (FREE) - Use for 90% of background tasks
2. **GPT-4o Mini** ($0.15/$0.60) - Fallback if DeepSeek fails
3. **Grok Fast / MiniMax** - Special cases only

### 4. Update USER.md

Add to workspace `USER.md`:

```markdown
### Preferences
- **Cost-conscious** - Be efficient with API usage
- **⚠️ CRITICAL: Sub-agents MUST use cheap models only**
  - **Auto-delegation priority:** DeepSeek V3 (FREE) → GPT-4o-mini ($0.15/$0.60) → Grok Fast / MiniMax
  - Available sub-agents: `gpt4o-mini`, `deepseek-v3`, `grok-fast`, `minimax`
  - Never spawn expensive models (Sonnet, GPT-4, etc.) for background tasks
  - Main session (Harvey): Sonnet 4.5 primary, DeepSeek V3 fallback
```

## Usage

### Spawn Sub-Agent
```
/spawn deepseek-v3 "your task here"
```

### Auto-Delegation
Harvey will automatically pick the best cheap model based on:
- Availability
- Task complexity
- Cost efficiency

## Benefits

**Before:**
- Sub-agent using Sonnet: ~$3-15 per 1M tokens
- 10 background tasks = $30-150 burned

**After:**
- Sub-agent using DeepSeek: FREE
- 10 background tasks = $0 💰

**Savings:** ~90-100% cost reduction on background tasks!

## Restart Gateway

After config changes:
```bash
clawdbot gateway restart
```

Or use the gateway config patch tool for live updates.

---

**Result:** Main session quality (Sonnet) + sub-agent efficiency (free/cheap models) = optimal setup! 🎯
