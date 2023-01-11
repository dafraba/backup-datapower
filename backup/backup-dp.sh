#!/bin/bash

#with this sentences it prints a message and after that it executes the script save-changes.sh
echo "Saving changes at datapower {{insert_your_appliance_name}}";
bash ~/Documents/scripts-for-dp/save-changes/save-changes.sh;

#prints a message, after that it executes the next bash
echo "Generating export file from all domins at {{insert_your_appliance_name}} in default domian";
bash ~/Documents/scripts-for-dp/export/generate-appliance-backup.sh;

#download the export.zip file from default domain to the selected subdirectory
echo "download export.zip from {{insert_your_appliance_name}}"
bash ~/Documents/scripts-for-dp/export/download-appliance-backup.sh;

#with this action, we generate destination files for your export.zip
echo "Generating destination folders"
bash ~/Documents/scripts-for-dp/export/generate-directories.sh;

#sending export.zip to the folder destination 
echo "sending your export.zip to the specified directory"
bash ~/Documents/scripts-for-dp/export/publish-backup.sh;

#bash finished
echo "Go to ~/Documents/scripts-for-dp/backup/respaldo-generado/{{timestamp}}/{{file_name}}.zip for see your {{file_name}}.zip file"