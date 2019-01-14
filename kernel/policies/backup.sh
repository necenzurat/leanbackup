{
    for backupPolicy in $(ls ${location}/backups/$repository/backup/*); do 
        logme "[$backupName] Doing backup policy: $backupPolicy";
        # $backupName"start"=$(date +%s.%N)
        include $backupPolicy
        # $backupName"end"=$(date +%s.%N)
        # DIFF=$(echo "$backupName"start" - $backupName"end"" | bc)
        # red $DIFF
        
        
        # errorLines=$(wc -l < $errorLogsFile);
        # if [ "$errorLines" -gt "0" ]; then
        #     errorMessage=$(cat $errorLogsFile)
        #     slack "$errorMessage\n\nError occured: [$backupName] - Backup policy: $backupPolicy"
        # fi
        # unset -v errorLines
        # unset -v errorMessage
    done

    for syncPolicy in $(ls ${location}/backups/$repository/sync/*); do 
        logme "[$backupName] Doing sync policy: $syncPolicy";
        include $syncPolicy  
    done

    for cleanup in $(ls ${location}/backups/$repository/cleanup/*); do 
        logme "[$backupName] Doing cleanup policy: $cleanup";
        include $cleanup 
    done
} 2>> $errorLogsFile