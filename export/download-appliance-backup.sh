#!/bin/bash
#you have to specify config.sh source path
source ~/Documents/backup-datapower/config.sh

#this sentence install jq (json processor for linux), if it is already install, bash continues to the next sentence without any changes, if not, press "y" when it asks
sudo apt-get install jq;

#this sentences invokes an http post for downloading export.zip from datapower (export subdiretory in the default domain) and generates an output named response.json
curl -k -u ${USERNAME}:${PASSWORD} https://${REST}/mgmt/filestore/default/export/export.zip -o response.json;

#with jq installed, we use it for opening the downloaded response.json file and extracts the file content tag and it generates another file named responseb64.txt..
jq .file response.json > response64.txt;

#we open the file with this sentence and then deletes the first character ("") from responseb64.txt and generates another file named archivob64.txt
tail -c +2 response64.txt > archivob64.txt;

#we open the file archivob64.txt and then deletes the last character ("") and generates another file named output.txt
sed 's/.$//' archivob64.txt > output.txt;

#this sentece decodes the content of the file output.txt and generating the zip file required. You can change file name export for whatever you want but you need to keep in mind to move in the publish-backup.sh bash.
base64 -d output.txt > export.zip;

#we clean up our space for those files we do not need
rm -f response.json response64.txt archivob64.txt output.txt;