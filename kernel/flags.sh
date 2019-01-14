while test $# -gt 0; do
    case "$2" in
        -h|--help)
            echo "leanbackup - lean back to bed"
            echo " "
            echo "./leanbackup [repo] commands [arguments]"
            echo " "
            echo "options:"
            echo "stats                     both stats"
            echo "-o, --output-dir=DIR      specify a directory to store output in"
            echo "-h, --help                show brief help"
            exit 0
            ;;
        # stats)
        #     shift
        #     if test $# -gt 0; then
        #         restic stats
        #         echo '==='
        #         restic stats --mode raw-data
        #     else
        #         echo "no process specified"
        #         exit 1
        #     fi
        #     shift
        #     ;;
        *)
            shift
            $0 $@
            break
            ;;
    esac
done