# this is where you define the backup policy
export BACKUP_PATHS="/home/forge/"
export BACKUP_EXCLUDES='--exclude="/home/forge/*/.git/*"'


restic unlock &
wait $!


restic backup \
	--verbose \
	--host $HOSTNAME \
	--tag 'files' \
	$BACKUP_PATHS \
	$BACKUP_EXCLUDES &
wait $!
