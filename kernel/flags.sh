if [ -d "${location}/backups/$1" ]; then
    aRepository=$1;
    shift
else 
    echo "repo does not exists"
    echo "available repos are:"
    for repository in $(ls ${location}/backups/); do
        echo $repository
    done
    
fi

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "leanbackup - lean back to bed"
            echo " "
            echo "./leanbackup [repo] [arguments]"
            echo " "
            echo "options:"
            echo "stats                     both stats"
            echo "-o, --output-dir=DIR      specify a directory to store output in"
            echo "-h, --help                show brief help"    
            exit 0
            ;;
        --ignore)
            shift
            skipPolicies="true"
            ;;
        --cron)
            shift
            runningFromCron="true"
            ;;
        *)
            shift
            echo "$0 $@"            
            echo "default fallback... "; 
            exit 1;
            break
            ;;
    esac
done

# echo "====="
# echo "skip" $skipPolicies
# echo "cron" $runningFromCron