# Load up .env
set -o allexport
include ${location}/backups/$repository/.env
set +o allexport

if [[ "$skipPolicies" == "true" ]]; then
    logme "[$backupName] manually skipping time policies"
    include ${location}/kernel/policies/backup.sh
else 
    include ${location}/kernel/policies/enabled.sh
fi
