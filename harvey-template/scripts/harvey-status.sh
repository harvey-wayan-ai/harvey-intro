#!/bin/bash
# Harvey Status - Combined AI + VPS status check

echo "🤖 Harvey Status Report"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# === VPS Resources ===
echo "🖥️  VPS Resources (2vCPU, 8GB RAM, 100GB SSD)"
echo "─────────────────────────────────────"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
RAM_USED=$(free -m | awk 'NR==2{printf "%.0f", $3}')
RAM_TOTAL=$(free -m | awk 'NR==2{printf "%.0f", $2}')
RAM_PERCENT=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')
DISK_USED=$(df -BG / | awk 'NR==2 {print $3}' | sed 's/G//')
DISK_TOTAL=$(df -BG / | awk 'NR==2 {print $2}' | sed 's/G//')
DISK_PERCENT=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# CPU Status
if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
    CPU_STATUS="⚠️ HIGH"
elif (( $(echo "$CPU_USAGE > 60" | bc -l) )); then
    CPU_STATUS="⚡ Medium"
else
    CPU_STATUS="✅ OK"
fi

# RAM Status
if [ "$RAM_PERCENT" -gt 80 ]; then
    RAM_STATUS="⚠️ HIGH"
elif [ "$RAM_PERCENT" -gt 60 ]; then
    RAM_STATUS="⚡ Medium"
else
    RAM_STATUS="✅ OK"
fi

# Disk Status
if [ "$DISK_PERCENT" -gt 80 ]; then
    DISK_STATUS="⚠️ HIGH"
elif [ "$DISK_PERCENT" -gt 60 ]; then
    DISK_STATUS="⚡ Medium"
else
    DISK_STATUS="✅ OK"
fi

printf "CPU:  %5.1f%% %s\n" "$CPU_USAGE" "$CPU_STATUS"
printf "RAM:  %s/%sMB (%s%%) %s\n" "$RAM_USED" "$RAM_TOTAL" "$RAM_PERCENT" "$RAM_STATUS"
printf "Disk: %s/%sGB (%s%%) %s\n" "$DISK_USED" "$DISK_TOTAL" "$DISK_PERCENT" "$DISK_STATUS"

echo ""

# === Clawdbot Status ===
echo "🦞 Clawdbot Service"
echo "─────────────────────────────────────"

if systemctl is-active --quiet clawdbot; then
    UPTIME=$(systemctl show clawdbot --property=ActiveEnterTimestamp | cut -d= -f2)
    echo "Status: ✅ Running"
    echo "Uptime: $(systemctl show clawdbot --property=ExecMainStartTimestamp | cut -d= -f2)"
else
    echo "Status: ⚠️ Not Running"
fi

echo ""

# === AI Model Info ===
echo "🧠 AI Model Status"
echo "─────────────────────────────────────"
echo "Primary: Claude Sonnet 4.5"
echo "Fallback: DeepSeek V3.2 (OpenRouter) - triggers at 70%"
echo ""
echo "💡 Run 'session_status' for detailed usage"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⏰ $(date '+%Y-%m-%d %H:%M:%S %Z')"
