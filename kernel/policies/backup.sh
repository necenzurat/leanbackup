{
    
    for backupPolicy in $(ls ${location}/backups/$repository/backup/*); do 
        logme "[$repository] Doing backup policy: $backupPolicy";
        $repository"start"=$(date +%s.%N)
        
        include $backupPolicy
        
        $repository"end"=$(date +%s.%N)
        DIFF=$(echo "$repository"start" - $repository"end"" | bc)
       
        
        # errorLines=$(wc -l < $errorLogsFile);
        # if [ "$errorLines" -gt "0" ]; then
        #     errorMessage=$(cat $errorLogsFile)
        #     slack "$errorMessage\n\nError occured: [$repository] - Backup policy: $backupPolicy"
        # fi
        # unset -v errorLines
        # unset -v errorMessage
        backupsThisRun+="backup [$repository] $backupPolicy: time spent: $DIFF\n"
    done

    for syncPolicy in $(ls ${location}/backups/$repository/sync/*); do 
        logme "[$repository] Doing sync policy: $syncPolicy";
        $repository"start"=$(date +%s.%N)
        
        include $syncPolicy 
        
        $repository"end"=$(date +%s.%N)
        DIFF=$(echo "$repository"start" - $repository"end"" | bc)

        backupsThisRun+="Sync [$repository] $syncPolicy: time spent: $DIFF\n"
    done

    for cleanupPolicy in $(ls ${location}/backups/$repository/cleanup/*); do 
        logme "[$repository] Doing cleanup policy: $cleanupPolicy";
        
        $repository"start"=$(date +%s.%N)
        
        include $cleanupPolicy 
        
        backupName"end"=$(date +%s.%N)
        DIFF=$(echo "$repository"start" - $repository"end"" | bc)
        backupsThisRun+="Cleanup [$repository] $backupPolicy: time spent: $DIFF\n" 

    done
} 2>> $errorLogsFile