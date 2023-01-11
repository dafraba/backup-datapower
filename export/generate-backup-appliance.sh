#!/bin/bash
#you have to specify config.sh source path
source ~/Documents/scripts-for-dp/config.sh

echo "realizando backup en datapower de appliance";
curl -k -u ${USERNAME}:${PASSWORD} -d @request-soma-for-backing-up.xml https://${XML}/service/mgmt/current &> /dev/null;
