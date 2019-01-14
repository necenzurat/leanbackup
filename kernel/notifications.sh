errorLines=$(wc -l < $errorLogsFile);

if [ "$errorLines" -gt "0" ]; then
    errorContents=$(cat $errorLogsFile)
    #prowl "Backup run, took $runTime ⌚";
    slack "An error occured\n$errorContents";
else 
    rm -rf $errorLogsFile;
fi

if [[ "$notifyWhenBackupsAreDone" == "true" ]]; then
    #prowl "Backup run, took $runTime ⌚";
    slack "Backup run, took $runTime ⌚";
fi
