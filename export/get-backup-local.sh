#!/usr/bin/bash
#you have to specify config.sh source path
source ~/Documents/scripts-for-dp/config.sh


echo "moviendo los archivos .zip a su respectivo repositorio"
mkdir -p ~/Documents/scripts-for-dp/backup/respaldo-generado/$(date '+%Y-%m-%d_%H-00');
mv export.zip ~/Documents/scripts-for-dp/backup/respaldo-generado/$(date '+%Y-%m-%d_%H-00');
rm -rf ~/Documents/scripts-for-dp/export/export.zip
