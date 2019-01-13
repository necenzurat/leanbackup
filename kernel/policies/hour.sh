
if [[ "$backupHours" == "everyhour" ]]; then
    logme "[$backupName] hour policy is $backupHours"
    include ${location}/kernel/policies/minute.sh
else 
    for hour in $customBackupHours; do
        if [ "$hour" == "$startHour" ]; then
            logme "[$backupName] - $backupHours" 
            include ${location}/kernel/policies/minute.sh
        fi	
    done 
fi
