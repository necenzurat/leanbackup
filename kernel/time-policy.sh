# Load up .env
set -o allexport
include ${location}/backups/$repository/.env
set +o allexport

if [ $skipTimePolicy ]; then
    logme "[$backupName] manually skipping time policies"
    include ${location}/kernel/policy.sh
else
     
    if [ ! -z "$backupEnabled" ]; then
    
        if [[ "$backupHours" == "everyhour" ]]; then
            logme "[$backupName] hour policy is $backupHours"
            include ${location}/kernel/policy.sh
        else 
            for hour in $customBackupHours; do
                if [ "$hour" == "$startHour" ]; then
                    
                    if [[ "$backupMinutes" == "everyminute" ]]; then
                        logme "[$backupName] time policy is $backupMinutes"
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


fi
