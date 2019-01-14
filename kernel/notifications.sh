errorLines=$(wc -l $errorLogsFile | awk '{ print $1 }');

if [ "$errorLines" -gt "0" ]; then
    errorContents=$(cat $errorLogsFile)
    #prowl "Backup run, took $runTime ⌚";
    slack "====\nAn error occured\n$errorContents\n\n";
else 
    rm -rf $errorLogsFile;
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
    slack "Backup on **$HOSTNAME** run, took $runTime ⌚ ";
fi
