errorLines=$(wc -l $errorLogsFile | awk '{ print $1 }');

if [ "$errorLines" -gt "0" ]; then
    errorContents=$(cat $errorLogsFile)
    #prowl "Backup run, took $runTime ⌚";
    slack "An error occured\n$errorContents";
else 
    rm -rf $errorLogsFile;
fi

if [[ "$notifyWhenBackupsAreDone" == "true" ]]; then
    #prowl "Backup run, took $runTime ⌚";
    slack "Backup on $HOSTNAME run, took $runTime ";
fi
