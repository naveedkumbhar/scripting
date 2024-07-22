#!/bin/bash

# Define the log file where system metrics will be recorded
LOG_FILE="/var/log/sys_metrics.log"

# Ensure the script is executable
chmod +x /home/naveed/scripts/monitoring.sh 

# Function to get the current timestamp in 'YYYY-MM-DD HH:MM:SS' format
get_timestamp() {
    echo "$(date '+%Y-%m-%d %H:%M:%S')"
}

# Function to get the CPU usage percentage
# This function uses 'top' to get the CPU usage and calculates the sum of user and system CPU time
get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | \
    awk '{print $2 + $4}' | \
    awk '{print $1"%"}'
}

# Function to get the Memory usage percentage
# This function uses 'free' to get the memory usage and calculates the percentage of used memory
get_mem_usage() {
    free | grep Mem | \
    awk '{print $3/$2 * 100.0}' | \
    awk '{print $1"%"}'
}

# Function to get the Disk usage percentage for the root (/) partition
# This function uses 'df' to get the disk usage for the root partition and extracts the usage percentage
get_disk_usage() {
    df / | grep / | \
    awk '{print $5}'
}

# Collect the metrics by calling the functions defined above
TIMESTAMP=$(get_timestamp)
CPU_USAGE=$(get_cpu_usage)
MEM_USAGE=$(get_mem_usage)
DISK_USAGE=$(get_disk_usage)

# Write the collected metrics to the log file with appropriate formatting
echo "#######################################################" >> $LOG_FILE
echo "[$TIMESTAMP] CPU: $CPU_USAGE, Memory: $MEM_USAGE, Disk: $DISK_USAGE" >> $LOG_FILE
echo "#######################################################" >> $LOG_FILE

# Error handling: check if the previous command (writing to the log file) was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to write metrics to $LOG_FILE" >&2
    exit 1
fi

