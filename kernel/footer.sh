endTime=`date +%s`
totalTimeInSeconds=$(expr $endTime - $startTime)
totalTimeInMinutes=$(($totalTimeInSeconds / 60))

if [ ! -z ${totalTimeInSeconds} ]; then
    if [ "$totalTimeInSeconds" -gt "60" ]; then
        runTime=$totalTimeInMinutes
    else 
        runTime=$totalTimeInSeconds
    fi
fi

if [ ! -z ${totalTimeInSeconds} ]; then
    if [ "$totalTimeInSeconds" -gt "60" ]; then
        lightblueb "Runtime was: $totalTimeInMinutes minutes (or exactly $totalTimeInSeconds seconds)"
    else 
        lightblueb "Runtime was: $totalTimeInSeconds seconds "
    fi
fi

