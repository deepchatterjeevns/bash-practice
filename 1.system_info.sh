#!/usr/bin/env bash

# ==============================================================================
# Script Name: system_info.sh
# Description: Gathers and displays basic system information (hostname, user, uptime, and disk usage).
# ==============================================================================

set -euo pipefail 

# --- Helper Functions ---
print_header() {
    local title="$1"
    echo -e "\n=================================================="
    echo -e " \033[1m${title}\033[0m" # Bold text for the header
    echo -e "=================================================="
}


# 1. Hostname
CURRENT_HOSTNAME=$(hostname) 

# 2. Current User
CURRENT_USER=$(id -un) 

# 3. System Uptime
SYSTEM_UPTIME=$(uptime -p 2>/dev/null || uptime) 

# --- Display Output ---

print_header "SYSTEM SUMMARY"
echo "Hostname     : ${CURRENT_HOSTNAME}"
echo "Current User : ${CURRENT_USER}"
echo "Uptime       : ${SYSTEM_UPTIME}" 

# 4. Disk Usage
print_header "DISK USAGE"
if df --help | grep -q 'suqashfs'; then 
    df -Th -x devtmpfs -x suqashfs 
else
  df -h 2>/dev/null || echo "Disk usage information not available."
fi 

echo ""








