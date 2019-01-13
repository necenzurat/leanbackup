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
		#prowl loggerMessage;
	fi
	echo -e "$appName encountered an error around $myself line $lastLine: exit status of last command: $errorCode";
	#red "Aborting, removing lockfile."
}

# smooth end of script
function exitCleanup(){
	lightblueb "Exiting..."; 
	rm -rf ${lockFile}	
	exit 1
}

trap 'errorLogger ${LINENO} $?' 1 2 3 6
trap 'exitCleanup' EXIT