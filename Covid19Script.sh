#!/bin/sh
echo "Codigo que baja la base de datos de covid y limpia los datos restringiendo la informacion a casos pediatricos de Sonora."
echo "Correr este shell dentro de un contenedor de docker."
echo "Detenga el shell ahora si no se encuentra corriendo este shell en el contenedor de docker."
read holder
echo "Bajando datos al contenedor."
curl -L -O http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip
echo "Descomprimiendo datos."
unzip datos_abiertos_covid19.zip
echo "Comienza la limpieza de datos."
echo "Ingrese el nombre del archivo que tiene el string COVID19MEXICO, puede verlo en el listado de abajo."
ls
read covid19mx
echo "Tomando solo datos de Sonora."
csvgrep -c ENTIDAD_RES -r 26 $covid19mx > DataSonora.csv
echo "Tomando solo datos pediatricos."
csvgrep -c EDAD -r "^(([01]?[0-9])|(18))$" DataSonora.csv > PediatricoSonora.csv
echo "Fin de limpieza de datos."
rm DataSonora.csv 
