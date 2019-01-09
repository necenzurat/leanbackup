if [ ! -z "$PROWL_API" ];
then
	prowl () {
		curl https://api.prowlapp.com/publicapi/add \
		-F apikey="$PROWL_API" \
		-F priority=0 \
		-F application="$APPNAME" \
		-F event="$APPNAME sent a message" \
		-F description="$1" #> /dev/null
	}
fi

if [ ! -z "$slackWebhook" ];
then
	function slack () {

		echo $1
		channel=$1
		if [[ $channel == "" ]]
		then
				echo "No channel specified"
				channel="#general"
		fi

		shift

		text=$*

		if [[ $text == "" ]]
		then
				echo "No text specified"
				exit 1
		fi

		escapedText=$(echo $text | sed 's/"/\"/g' | sed "s/'/\'/g" )
		
		json="{\"channel\": \"#$channel\", \"text\": \"$escapedText\", \"username\": \"$APPNAME\"}"

		curl -X POST -H 'Content-type: application/json' --data "$json" https://hooks.slack.com/services/$slackWebhook
	}
fi