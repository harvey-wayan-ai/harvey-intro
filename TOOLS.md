# TOOLS.md - Local Notes

Skills define *how* tools work. This file is for *your* specifics — the stuff that's unique to your setup.

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
