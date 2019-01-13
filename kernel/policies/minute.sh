
if [[ "$backupMinutes" == "everyhour" ]]; then
    logme "[$backupName] minute policy is $backupMinutes"
    include ${location}/kernel/policies/backup.sh
else 
    for minute in $customBackupMinutes; do
        if [ "$minute" == "$startMinute" ]; then
            logme "[$backupName] backup minute time is $minute"
            include ${location}/kernel/policies/backup.sh
        fi	
    done
fi