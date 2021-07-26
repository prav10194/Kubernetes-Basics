for pid in `ps -ef | grep 'Firefox' | awk '{print $2}'` ; do kill $pid ; done 2>/dev/null 
open -a /Applications/Firefox.app
echo "Closed all instances. Restarting again!"
