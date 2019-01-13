# this is where you define the backup policy
export BACKUP_PATHS="/home/forge/"
export BACKUP_EXCLUDES='--exclude="/home/forge/*/.git/*"'


MYSQL_USER=""
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD=""
MYSQLDUMP=/usr/bin/mysqldump

restic unlock &
wait $!
 
databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql)"`

for database in $databases; do
	
	size=$(mysql \
	--user=$MYSQL_USER \
	-p$MYSQL_PASSWORD \
	-e "SELECT ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) as ''
		FROM information_schema.tables 
		WHERE table_schema = '$database';" | sed ':a;N;$!ba;s/\n/ /g' | awk '{$1=$1};1')
	
	logme "doing $database, $size MB"
	#echo  "$MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $database"
	$MYSQLDUMP \
		--force \
		--opt \
		--user=$MYSQL_USER -p$MYSQL_PASSWORD \
		--databases $database | 
	restic backup \
		--tag 'database' \
		--tag $database \
		--tag "size:$sizeMB" \
		--host $HOSTNAME \
		--stdin \
		--stdin-filename $database.sql
done
