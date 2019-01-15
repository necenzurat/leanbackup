source ${location}/kernel/paths.sh

# include stuff
# colors
source ${location}/kernel/bootstrap/colors.sh
# trap functions
source ${location}/kernel/bootstrap/trap.sh
# loader
source ${location}/kernel/bootstrap/loader.sh
envloader ${location}/.env
# logger
source ${location}/kernel/bootstrap/logger.sh
# locker
source ${location}/kernel/bootstrap/locker.sh
# notifications
source ${location}/kernel/bootstrap/notification-providers.sh

source ${location}/kernel/bootstrap/updater.sh

# NOW STOP, HAMMER
time=$(date +%Y-%m-%d-%H-%M-%S)

backupsThisRun=""