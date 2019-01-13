# Remove old repos based on backup strategy
restic unlock &
wait $!

restic forget \
	--verbose \
	--group-by "paths,tags" \
	--keep-last $RETENTION_PERIOD & 
wait $!

 
restic prune \
	--verbose &
wait $!
