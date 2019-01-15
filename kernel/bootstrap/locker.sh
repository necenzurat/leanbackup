# you only run once, yoro
lockFile=${location}/storage/.$selfBash.lock

# only when we doing backup
if [[ "$enableLock" == "true" ]]; then
	if [ ! -f $lockFile ]; then
		touch $lockFile;
	else 
		redb "Failed to acquire lock."
		self=$(basename "$0")	
		if ps ax | grep $0 | grep -v $$ | grep bash | grep -v grep
		then
			redb "The script is already running."
			exit 1;
		else 
			redb "The lockfile ($lockFile) has gone rogue."
			exit 1;
		fi
	fi
fi