#!/bin/bash
echo "Guardando cambios en datapower de desarrollo";
#llamamos al bash para guardar cambios
bash ~/Documents/scripts-dp/save-changes/save-changes.sh;

#llamamos al bash que genera el export en datapower
echo "Generando export de todos los dominios en datapower dominio default ";
bash ~/Documents/scripts-dp/export/generate-backup.sh;

#descargamos el export en nuestra máquina local
echo "descargando el achivo export.zip de generado en datapower"
bash ~/Documents/scripts-dp/export/obtiene-export.sh;

#generamos los directorios correspondientes
echo "se generan los directorios correspondientes"
bash ~/Documents/scripts-dp/export/genera-directorios.sh;

#limpiamos la información miscélanea generada
echo "limpiando la información y generando el archivo en el repositorio especificado"
bash ~/Documents/scripts-dp/export/generate-backup-file.sh;

#finalizamos nuestro script
echo "ir a ~/Documents/scripts-dp/backup/respaldo-dp1 e ingresar a la carpeta para verificar el archivo descargado"