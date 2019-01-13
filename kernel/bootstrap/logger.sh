logFile=${location}/ephemeral/.$appName.log

if [ ! -f $logFile ]; then
    touch $logFile
fi

function logsetup {
    TMP=$(tail -n $maxLogSize $logFile 2>/dev/null) && echo -e "${TMP}\n" > $logFile
    exec > >(tee -a $logFile)
    exec 2>&1
}

function logme {
    echo -e "[$(date "+%F %T %Z")]: $*"
}

logsetup