#!/usr/bin/bash
#you have to specify config.sh source path
#source ~/Documents/backup-datapower/config.sh

#with this sentence you create a subfolder inside the base path in backup subfolder for your new generated export, you can change as you require
echo "moviendo los archivos .zip a su respectivo repositorio"
mkdir -p ~/Documents/backup-datapower/backup/respaldo-generado/$(date '+%Y-%m-%d_%H-00');

#with this sentence you move the final file (you can change the name, it depends on what name you choose in download-appliance-backup as final name file)
mv export.zip ~/Documents/backup-datapower/backup/respaldo-generado/$(date '+%Y-%m-%d_%H-00');

#cleaning up temporary files generated, you need to specify the name file you used for download-appliance-backup.sh.
rm -rf ~/Documents/backup-datapower/export/export.zip
