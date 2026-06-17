#!/bin/bash

echo "========================================="
echo "       System Performance Stats"
echo "========================================="
echo

OS=$(uname)
echo "$OS"

# CPU Usage
echo "CPU Usage:"

if [ "$OS" = "Linux" ]; then
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
else
    CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3 + $5}')
fi

echo "  Total CPU Usage: ${CPU_USAGE}%"
echo

# Memory Usage
echo "Memory Usage:"

if [ "$OS" = "Linux" ]; then
    MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
    MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
    MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
else
    MEM_TOTAL=$(sysctl -n hw.memsize)
    MEM_TOTAL=$((MEM_TOTAL / 1024 / 1024))

    PAGE_SIZE=$(sysctl -n hw.pagesize)
    FREE_PAGES=$(vm_stat | awk '/Pages free/ {gsub("\\.","",$3); print $3}')
    MEM_FREE=$((FREE_PAGES * PAGE_SIZE / 1024 / 1024))
    MEM_USED=$((MEM_TOTAL - MEM_FREE))
fi

MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")

echo "  Total: ${MEM_TOTAL} MB"
echo "  Used : ${MEM_USED} MB (${MEM_PERCENT}%)"
echo "  Free : ${MEM_FREE} MB"
echo

# Disk Usage
echo "Disk Usage:"

df -h / | awk '
NR==2{
print "  Total: " $2
print "  Used : " $3 " (" $5 ")"
print "  Free : " $4
}'
echo

# Top CPU Processes
echo "Top 5 Processes by CPU Usage:"

if [ "$OS" = "Linux" ]; then
    ps -eo pid,comm,%cpu --sort=-%cpu | head -6
else
    ps -Ao pid,comm,%cpu | sort -k3 -nr | head -6
fi

echo

# Top Memory Processes
echo "Top 5 Processes by Memory Usage:"

if [ "$OS" = "Linux" ]; then
    ps -eo pid,comm,%mem --sort=-%mem | head -6
else
    ps -Ao pid,comm,%mem | sort -k3 -nr | head -6
fi

echo

# Extra Stats
echo "System Information:"
echo "  Hostname: $(hostname)"
echo "  Uptime: $(uptime)"

echo
echo "========================================="
echo "           End of Report"
echo "========================================="