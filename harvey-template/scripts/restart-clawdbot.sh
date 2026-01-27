#!/bin/bash
# Auto-restart Clawdbot with verification

set -e

echo "🛑 Stopping Clawdbot..."
clawdbot gateway stop || true

echo "⏳ Waiting 3 seconds..."
sleep 3

echo "🚀 Starting Clawdbot..."
clawdbot gateway start

echo "⏳ Waiting for daemon to stabilize..."
sleep 2

echo "✅ Verifying status..."
clawdbot gateway status

echo ""
echo "✅ Restart complete! Harvey should ping you soon."
