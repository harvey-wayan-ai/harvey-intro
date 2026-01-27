#!/bin/bash
# Robust Clawdbot restart with auto-notify

LOGFILE="/root/clawd/logs/restart-$(date +%Y%m%d-%H%M%S).log"
mkdir -p "$(dirname "$LOGFILE")"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

log "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
log "🔄 Starting Clawdbot restart"
log "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Mark boot time for auto-notify
echo "$(date +%s)" > /tmp/harvey-boot-time

log "🛑 Stopping gateway..."
clawdbot gateway stop >> "$LOGFILE" 2>&1 || log "⚠️ Already stopped"

log "⏳ Waiting 3 seconds..."
sleep 3

log "🔧 Running doctor..."
clawdbot doctor --fix >> "$LOGFILE" 2>&1

log "🚀 Starting gateway..."
clawdbot gateway start >> "$LOGFILE" 2>&1 || {
    log "⚠️ Retry..."
    sleep 2
    clawdbot gateway start >> "$LOGFILE" 2>&1
}

log "⏳ Waiting 8 seconds..."
sleep 8

log "✅ Restart complete!"
log "📝 Log: $LOGFILE"
