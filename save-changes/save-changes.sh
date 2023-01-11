#!/usr/bin/bash
#you have to specify config.sh source path
source ~/Documents/scripts-dp/config.sh

#this action sends to your datapower device an http post in every domain you have, you need to add every domain you have replacing the ending of the url, in this case "default"
curl -k -u ${USERNAME}:${PASSWORD} https://${REST}/mgmt/actionqueue/default -d '{"SaveConfig":"filler"}'
