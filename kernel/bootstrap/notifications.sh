
prowl () {
	if [ ! -z "$prowlApi" ]; then
		curl -s -S https://api.prowlapp.com/publicapi/add \
		-F apikey="$prowlApi" \
		-F priority=0 \
		-F application="$appName" \
		-F event="$appName sent a message" \
		-F description="$1" > /dev/null
	else
		echo "prowl not configured"
	fi
}


function slack () {
if [ ! -z "$slackWebhook" ]; then
	echo $1
	channel=$1
	if [[ $channel == "" ]]
	then
		echo "No channel specified, using default channel #general"
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
	json="{\"channel\": \"#$channel\", \"text\": \"$escapedText\", \"username\": \"$appName\"}"
	curl -X POST -H 'Content-type: application/json' --data "$json" $slackWebhook
	fi
}
