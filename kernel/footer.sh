endTime=`date +%s`
totalTimeInSeconds=$(expr $endTime - $startTime)
totalTimeinMinutes=$(expr $totalTimeInSeconds / 60)

if [ ! -z ${totalTimeInSeconds} ]; then
    if [ "$totalTimeInSeconds" -gt "60" ]; then
        runTime=$totalTimeinMinutes
    else 
        runTime=$totalTimeInSeconds
    fi
fi

# if [ ! -z "$notifyWhenBackupsAreDone" ]; then
#     prowl "Backup run, took $runTime ⌚";
#     slack "Backup run, took $runTime ⌚";
# fi
