errorLines=$(wc -l $errorLogsFile | awk '{ print $1 }');

if [ "$errorLines" -gt "0" ]; then
    errorContents=$(cat $errorLogsFile)
    #prowl "Backup run, took $runTime ⌚";
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
    slack "App run on $HOSTNAME run, took $runTime ⌚ ";
fi

rm -rf $errorLogsFile;