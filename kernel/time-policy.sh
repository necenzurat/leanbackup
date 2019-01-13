include ${location}/backups/$repository/.env

if [ ! -z "$backupEnabled" ]; then

    if [[ "$backupTime" == "everyhour" ]]; then
        logme "[$backupName] time policy is is $backupTime"
        include ${location}/kernel/policy.sh
    else 
        for hour in $customBackupHours; do
            if [ "$hour" == "$startHour" ]; then
                
                if [[ "$backupMinutes" == "everyminute" ]]; then
                    logme "[$backupName] time policy is is $backupMinutes"
                    include ${location}/kernel/policy.sh
                else 
                    for minute in $customBackupMinutes; do
                        if [ "$minute" == "$startMinute" ]; then
                            logme "[$backupName] backup minute time is $backupTime"
                            include ${location}/kernel/policy.sh
                        fi	
                    done
                    # end for minutes
                fi
                # end if minutes
            fi	
            # end if hour
        done 
        # end for hour
    fi

else 
    logme "[$backupName] Backups are disabled in .env"
fi
