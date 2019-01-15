selfBash="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

errorLogsFile=${location}/storage/logs/error-${RANDOM:0:10}.log
touch $errorLogsFile;

# relative bins
restic=$(which restic)
curl=$(which curl)
git=$(which curl)
