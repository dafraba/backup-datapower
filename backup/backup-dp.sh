#!/bin/bash

#with this sentences it prints a message and after that it executes the script save-changes.sh
echo "Saving changes at datapower {{insert_your_appliance_name}}";
bash ~/Documents/backup-datapower/save-changes/save-changes.sh;


#prints a message, after that it executes the next bash
echo "Generating export file from all domins at {{insert_your_appliance_name}} in default domian";
bash ~/Documents/backup-datapower/export/generate-appliance-backup.sh;

#download the export.zip file from default domain to the selected subdirectory
echo "download export.zip from {{insert_your_appliance_name}}"
bash ~/Documents/backup-datapower/export/download-appliance-backup.sh;

#with this action, we generate destination files for your export.zip
echo "Generating destination folders"
bash ~/Documents/backup-datapower/export/generate-directories.sh;

#sending export.zip to the folder destination 
echo "sending your export.zip to the specified directory"
bash ~/Documents/backup-datapower/export/publish-backup.sh;

#bash finished
echo "Go to ~/Documents/backup-datapower/ackup/respaldo-generado/{{timestamp}}/{{file_name}}.zip for see your {{file_name}}.zip file"