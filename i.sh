#!/bin/bash
#
# ./i - the init 
#
# @version  0.1.0
# @date     2019-01-09
# @license  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE

startTime=`date +%s`

# path
location="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

errorLogsFile=${location}/storage/logs/.error.${RANDOM:0:10}.log

source ${location}/kernel/header.sh

# do stuff before making any backup
for files in $(ls ${location}/pre-backup/); do
	include ${location}/pre-backup/$files 
done

startMinute=$(date +"%M")
startHour=$(date +"%H")

# backup specific repo
if [ ! -z "$1" ]; then
    envPath=${location}/backups/$1/.env;
    if [[ -f "$envPath" ]]; then
        include $envPath;
        #echo $RESTIC_REPOSITORY
        restic -r $RESTIC_REPOSITORY init 
    else
        red "There is no repo named $1"
        exit;
    fi 
fi
