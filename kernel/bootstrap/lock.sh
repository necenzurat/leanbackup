# you only run once, yoro

if [ ! -f $lockfile ]; then
    touch $lockfile;
else 
	redb "Failed to acquire lock."
	self=$(basename "$0")	
	if ps ax | grep $0 | grep -v $$ | grep bash | grep -v grep
	then
	    redb "The script is already running."
	    exit 1;
	else 
		redb"The lockfile ($lockfile) has gone rogue."
		exit 1;
	fi
fi
