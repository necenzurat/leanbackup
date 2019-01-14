now=$(date +"%M")
remainder=$(( now % 5 ))
if [ "$remainder" -eq 0 ]; then
    logme 'trying to update myself'
    git pull origin master &> /dev/null
fi