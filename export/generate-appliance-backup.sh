#!/bin/bash
#you have to specify config.sh source path
source ~/Documents/backup-datapower/config.sh

#this sentence sends an xml request via http post to datapower xml management interface for executing backup for all domains and generates an export.zip in default domain 
echo "backing up your {{insert_your_appliance_name}}";
curl -k -u ${USERNAME}:${PASSWORD} -d @request-soma-for-backing-up.xml https://${XML}/service/mgmt/current &> /dev/null;
