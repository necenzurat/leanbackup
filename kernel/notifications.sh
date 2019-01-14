errorLines=$(wc -l $errorLogsFile | awk '{ print $1 }');

if [ "$errorLines" -gt "0" ]; then
    errorContents=$(cat $errorLogsFile)

    slack "====\nAn error occured\n$errorContents\n\n";
fi

if [ ! -z $totalTimeInSeconds ]; then
    if [ "$totalTimeInSeconds" -gt "60" ]; then
        runTime=$totalTimeInMinutes" seconds"
    else 
        runTime=$totalTimeInSeconds" seconds"
    fi
fi

if [ ! -z "$backupsThisRun" ]; then
    if [[ "$notifyWhenBackupsAreDone" == "true" ]]; then
        #prowl "Backup run, took $runTime ⌚";
        slack "⌚$appName run on $HOSTNAME, elasped: ⌚ $backupsThisRun";
    fi
fi

rm -rf $errorLogsFile;