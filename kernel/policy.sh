for backupPolicy in $(ls ${location}/backups/$repository/backup/*); do 
    logme "[$backupName] Doing backup policy: $backupPolicy";
    include $backupPolicy
done

for syncPolicy in $(ls ${location}/backups/$repository/sync/*); do 
    logme "[$backupName] Doing sync policy: $syncPolicy";
    include $syncPolicy
done

for cleanup in $(ls ${location}/backups/$repository/cleanup/*); do 
    logme "[$backupName] Doing cleanup policy: $cleanup";
    include $cleanup
done