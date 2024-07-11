#!/bin/bash

# Define the log file
LOG_FILE="/var/log/sys_metrics.log"

# Ensure the script is executable
chmod +x /home/naveed/scripts/monitoring.sh 

# Function to get the current timestamp
get_timestamp() {
    echo "$(date '+%Y-%m-%d %H:%M:%S')"
}

# Function to get CPU usage
get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | \
    awk '{print $2 + $4}' | \
    awk '{print $1"%"}'
}

# Function to get Memory usage
get_mem_usage() {
    free | grep Mem | \
    awk '{print $3/$2 * 100.0}' | \
    awk '{print $1"%"}'
}

# Function to get Disk usage for the / partition
get_disk_usage() {
    df / | grep / | \
    awk '{print $5}'
}

# Collect the metrics
TIMESTAMP=$(get_timestamp)
CPU_USAGE=$(get_cpu_usage)
MEM_USAGE=$(get_mem_usage)
DISK_USAGE=$(get_disk_usage)

# Output the metrics to the log file
echo "#######################################################" >> $LOG_FILE
echo "[$TIMESTAMP] CPU: $CPU_USAGE, Memory: $MEM_USAGE, Disk: $DISK_USAGE" >> $LOG_FILE
echo "#######################################################" >> $LOG_FILE

# Error handling
if [ $? -ne 0 ]; then
    echo "Error: Failed to write metrics to $LOG_FILE" >&2
    exit 1
fi

