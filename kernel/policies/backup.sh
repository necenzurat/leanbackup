{
    for backupPolicy in $(ls ${location}/backups/$repository/backup/*); do 
        logme "[$repository] Doing backup policy: $backupPolicy";
        policyStartTime=$(date +%s)
        
        include $backupPolicy
        
        policyEndTime=$(date +%s)
        differrence=$(echo $policyEndTime - $policyStartTime | bc)

        backupsThisRun+="Backup [$repository]\n$backupPolicy:\nElapsed: $differrence\n"
    done

    for syncPolicy in $(ls ${location}/backups/$repository/sync/*); do 
        logme "[$repository] Doing sync policy: $syncPolicy";
        policyStartTime=$(date +%s)
        
        include $syncPolicy 
        
        policyEndTime=$(date +%s)
        differrence=$(echo $policyEndTime - $policyStartTime | bc)

        backupsThisRun+="Sync [$repository]\n$syncPolicy:\nElapsed: $differrence\n"
    done

    for cleanupPolicy in $(ls ${location}/backups/$repository/cleanup/*); do 
        logme "[$repository] Doing cleanup policy: $cleanupPolicy";
        
        policyStartTime=$(date +%s)
        
        include $cleanupPolicy 
        
        policyEndTime=$(date +%s)
        differrence=$(echo $policyEndTime - $policyStartTime | bc)

        backupsThisRun+="Cleanup [$repository]\n$cleanupPolicy:\nElapsed: $differrence\n\n\n" 
    done
} 2>> $errorLogsFile