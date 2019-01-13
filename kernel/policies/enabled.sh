
if [[ "$backupEnabled" == "true" ]]; then
    include ${location}/kernel/policies/hour.sh
else 
    logme "[$backupName] Backups are disabled in .env"
fi
