#!/bin/bash
echo "Guardando cambios en datapower de {{nombre_appliance}}";
#llamamos al bash para guardar cambios
bash ~/Documents/scripts-for-dp/save-changes/save-changes.sh;

#llamamos al bash que genera el export en datapower
echo "Generando export de todos los dominios en datapower dominio default ";
bash ~/Documents/scripts-for-dp/export/generate-appliance-backup.sh;

#descargamos el export en nuestra máquina local
echo "descargando el achivo export.zip de generado en datapower"
bash ~/Documents/scripts-for-dp/export/download-appliance-backup.sh;

#generamos los directorios correspondientes
echo "se generan los directorios correspondientes"
bash ~/Documents/scripts-for-dp/export/generate-directories.sh;

#limpiamos la información miscélanea generada
echo "limpiando la información y generando el archivo en el repositorio especificado"
bash ~/Documents/scripts-for-dp/export/publish-backup.sh;

#finalizamos nuestro script
echo "ir a ~/Documents/scripts-for-dp/backup/respaldo-generado/{{timestamp}}/export.zip e ingresar a la carpeta para verificar el archivo descargado"