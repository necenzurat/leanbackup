endTime=`date +%s`
totalTimeInSeconds=$(expr $endTime - $startTime)
totalTimeinMinutes=$(expr $totalTimeInSeconds / 60)

# sizeForRestoring=$(restic stats)
# sizeInRepository=$(restic stats --mode raw-data)

# size=$(df -h);
# text="
# Backup took $totalTimeinMinutes ⌚";



# slack "#general" "$text"
# prowl "$text"