# this is trap, not the music genre but the nice handler

errorLogger() {
	myself="$0"     # equals to my script name
	lastLine="$1"   # argument 1: last line of error occurence
	errorCode="$2"    # argument 2: error code of last command
	
	if [ "$errorCode" == "130" ] ; then 
		lightblueb "Control-C detected, terminating..." 
	else 
		loggerMessage="$appName encountered an error at "${TIME}" in ${myself}: line ${lastLine}: exit status of last command: ${errorCode}\n"
		yellow $loggerMessage
		prowl loggerMessage;
	fi
	
	red "Aborting, removing lockfile."
}

# smooth end of script
function exitCleanup(){
	lightblueb "Exiting..."; 
	rm -rf ${lockFile}
	if [ ! -z ${totalTimeInSeconds} ]; then
		if [ "$totalTimeInSeconds" -gt "60" ]; then
			lightblueb "Runtime was: $totalTimeinMinutes minutes (or exactly totalTimeInSeconds seconds)"
		else 
			lightblueb "Runtime was: $totalTimeInSeconds seconds "
		fi
	fi
	exit 1
}

trap 'errorLogger ${LINENO} $?' 1 2 3 6
trap 'exitCleanup' EXIT