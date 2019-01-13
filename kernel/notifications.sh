#errorLines=$(wc -l < $errorLogsFile);

# if [ "$errorLines" -gt "0" ]; then
#     errorContents=$(cat $errorLogsFile)
#     #prowl "Backup run, took $runTime ⌚";
#     slack "an error occured\n$errorContents";
# else 
#     rm -rf $errorLogsFile;
# fi

# if [ ! -z "$notifyWhenBackupsAreDone" ]; then
#     prowl "Backup run, took $runTime ⌚";
#     slack "Backup run, took $runTime ⌚";
# fi
