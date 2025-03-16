#Task Overview
This project contains a Bash script that automates the backup of system logs from the /var/log directory. The script performs the following tasks:

Creates a backup of the /var/log directory.
Compresses the backup with a timestamped filename.
Deletes backups older than 7 days to manage storage efficiently.
🛠 Features
✅ Automated Backup: Creates and compresses log backups.
✅ Timestamped Files: Ensures each backup has a unique timestamped filename.
✅ Auto Cleanup: Deletes backups older than 7 days.
✅ Logging: Logs backup status and errors for troubleshooting.
✅ Modular & Efficient: Uses best practices in Bash scripting.

📜 Script Details
The script performs the following steps:

Defines Variables

BACKUP_DIR: Storage location for backups (/var/log-backups).
LOG_DIR: Directory to back up (/var/log).
TIMESTAMP: Generates a timestamp for unique filenames.
LOG_FILE: Stores script execution logs.
RETENTION_DAYS: Specifies backup retention period (7 days).
Ensures the Backup Directory Exists

Creates the backup directory if it doesn’t exist.
Performs Backup & Compression

Uses tar to create a compressed .tar.gz backup.
Deletes Old Backups

Removes backups older than 7 days using find command.
Logs the Process

Writes logs to /var/log/backup_script.log for tracking execution.
🚀 How to Use
