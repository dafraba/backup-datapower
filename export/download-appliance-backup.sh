#!/bin/bash
#you have to specify config.sh source path
source ~/Documents/scripts-for-dp/config.sh

#instalamos jq, si ya está instalado, automáticamente seguirá con la ejecución del programa, si no, sólo preguntará si deseamos instalar, teclear "y"
sudo apt-get install jq;

#se obtiene el export generado desde el directorio local mediante la api en formato json
curl -k -u ${USERNAME}:${PASSWORD} https://${REST}/mgmt/filestore/default/export/export.zip -o response.json;
#se extrae el contenido de la etiqueta "file" del response.json y se genera un nuevo archivo llamado responseb64.txt
jq .file response.json > response64.txt;
#se elimina el primer caracter (comillas) del responseb64.txt y se genera un nuevo archivo llamado archivob64.txt
tail -c +2 response64.txt > archivob64.txt;
#se elimina el último caracter (comillas) del archivob64 y se genera un nuevo archivo llamado output
sed 's/.$//' archivob64.txt > output.txt;
#se hace la decodificación del archivo output.txt para obtener el archivo xml de configuración
base64 -d output.txt > export.zip;
#se eliminan todos los archivos gerados, excepto el xml final
rm -f response.json response64.txt archivob64.txt output.txt;