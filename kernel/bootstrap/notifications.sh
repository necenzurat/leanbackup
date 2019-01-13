
prowl () {
	if [ ! -z "$prowlApi" ]; then
		curl -s -S https://api.prowlapp.com/publicapi/add \
		-F apikey="$prowlApi" \
		-F priority=0 \
		-F application="$appName" \
		-F event="$appName sent a message" \
		-F description="$1" > /dev/null
	else
		logme "Prowl not configured"
	fi
}

#
function slack () {
	if [ ! -z "$slackWehook" ]; then
		text=$1
		channel=$2
		
		if [[ $text == "" ]]; then
			logme "No text specified, skipping"
		fi

		if [[ $channel == "" ]]; then
			logme "No channel specified, using default channel #general"
			channel="#general"
		fi

		escapedText=$(echo $text | sed 's/"/\"/g' | sed "s/'/\'/g" )		
		json="{\"channel\": \"#$channel\", \"text\": \"$escapedText\", \"username\": \"$appName\"}"
		response=$(curl -s -X POST -H 'Content-type: application/json' --data "$json" $slackWehook)
		if [ "$response" != "ok" ]; then
			logme "Error posting to Slack"
		fi
	else
		logme "Slack not configured"
	fi
}
