#!/bin/bash
# Check VPS resources and warn if high usage

# VPS Specs
MAX_CPU=2
MAX_RAM=8192 # MB

# Get current usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
RAM_USAGE=$(free -m | awk 'NR==2{printf "%.0f", $3}')
RAM_PERCENT=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "📊 VPS Resource Status"
echo "─────────────────────"
echo "CPU: ${CPU_USAGE}% (${MAX_CPU} vCPU)"
echo "RAM: ${RAM_USAGE}MB / ${MAX_RAM}MB (${RAM_PERCENT}%)"
echo "Disk: ${DISK_USAGE}%"
echo ""

# Warnings
WARN=0

if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
    echo "⚠️ HIGH CPU USAGE: ${CPU_USAGE}%"
    WARN=1
fi

if [ "$RAM_PERCENT" -gt 80 ]; then
    echo "⚠️ HIGH RAM USAGE: ${RAM_PERCENT}%"
    WARN=1
fi

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "⚠️ HIGH DISK USAGE: ${DISK_USAGE}%"
    WARN=1
fi

if [ $WARN -eq 0 ]; then
    echo "✅ All resources OK"
fi

exit $WARN
