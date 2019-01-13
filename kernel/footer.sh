endTime=`date +%s`
totalTimeInSeconds=$(expr $endTime - $startTime)
totalTimeInMinutes=$(expr $totalTimeInSeconds / 60)

if [ ! -z ${totalTimeInSeconds} ]; then
    if [ "$totalTimeInSeconds" -gt "60" ]; then
        runTime=$totalTimeInMinutes
    else 
        runTime=$totalTimeInSeconds
    fi
fi

errorLines=$(wc -l < $errorLogsFile);

if [ "$errorLines" -gt "0" ]; then
    errorContents=$(cat $errorLogsFile)
    echo "error, shit";
    echo $errorContents
    #prowl "Backup run, took $runTime ⌚";
    slack "an error occured\n$errorContents";
else 
    echo 'rm #rm -rf $errorLogsFile'
fi

# if [ ! -z "$notifyWhenBackupsAreDone" ]; then
#     prowl "Backup run, took $runTime ⌚";
#     slack "Backup run, took $runTime ⌚";
# fi
