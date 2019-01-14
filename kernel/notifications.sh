errorLines=$(wc -l $errorLogsFile | awk '{ print $1 }');

if [ "$errorLines" -gt "0" ]; then
    errorContents=$(cat $errorLogsFile)

    slack "====\nAn error occured\n$errorContents\n\n";
fi

if [ ! -z ${totalTimeInSeconds} ]; then
    if [ "$totalTimeInSeconds" -gt "60" ]; then
        runTime=$totalTimeInMinutes" seconds"
    else 
        runTime=$totalTimeInSeconds" seconds"
    fi
fi

if [[ "$notifyWhenBackupsAreDone" == "true" ]]; then
    #prowl "Backup run, took $runTime ⌚";
    slack "App run on $HOSTNAME run, \n\n$backupsThisRun";
fi

rm -rf $errorLogsFile;