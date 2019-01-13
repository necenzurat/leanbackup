# Load up .env
set -o allexport
include ${location}/backups/$repository/.env
set +o allexport

if [ $skipPolicies ]; then
    logme "[$backupName] manually skipping time policies"
    include ${location}/kernel/policy.sh
else 
    include ${location}/kernel/policies/enabled.sh
fi
