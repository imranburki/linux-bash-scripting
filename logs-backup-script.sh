#!/bin/bash

# Variables
BACKUP_DIR="/var/log-backups"
LOG_DIR="/var/log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/log_backup_${TIMESTAMP}.tar.gz"
LOG_FILE="/var/log/backup_script.log"
RETENTION_DAYS=7

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Function to log messages
log_message() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" | tee -a "$LOG_FILE"
}

# Backup & compress
log_message "Starting backup of $LOG_DIR..."
if tar -czf "$BACKUP_FILE" "$LOG_DIR" 2>>"$LOG_FILE"; then
    log_message "Backup successful: $BACKUP_FILE"
else
    log_message "Error: Backup failed!"
    exit 1
fi

# Delete old backups
log_message "Deleting backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -name "log_backup_*.tar.gz" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \; 2>>"$LOG_FILE"

log_message "Backup process completed successfully!"
exit 0
