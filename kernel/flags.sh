while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`

    if [[ "$PARAM" == -* ]]; then
        case $PARAM in
            -h | --help)
                echo "-h"
                exit
                ;;
            --cron| -cron)
                runningFromCron=true
                ;;
            *)
                # echo "ERROR: unknown parameter \"$PARAM\""
                # echo "*"
                # exit 1
                ;;
        esac
        shift;
    fi;
    break;
done