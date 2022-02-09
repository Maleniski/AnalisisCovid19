# Analizando datos de COVID-19

## Resumen ejecutivo:

<div style="text-align: justify">
La presente página tiene como objetivo presentar los resultados de la actividad "Descargando y analizando los datos de COVID" del curso "Herramientas de Productividad para Ciencia de Datos" de la Universidad de Sonora.
El objetivo del ejercicio es determinar cuál es la sintomatología más común para los casos pediátricos reportados en la base de datos del Estado de Sonora.
Dentro de un contenedor de Docker se corrió un script de la línea de comando de UNIX que permite considerar solo los casos del estado de Sonora de pacientes pediátricos.
Posteriormente, se utilizó un Jupyter Notebook dentro de un env de Conda en Visual Studio Code para determinar por medio de la libreria Pandas y SeaBorn la sintomatología que se presenta con mayor frecuencia en los pacientes menores de 18 años.
</div>

##Metodología

Se creó un contenedor de ubuntu por medio del siguiente comando

<code>docker run -it --name AnalisisCovid -e LANG=C.UTF-8 ubuntu</code>

Dentro de la imagen AnalisisCovid se creó un scrip de shell el cual de manera quasi-automática realiza lo siguiente:

- Descarga las paqueterías necesarias para la limpieza de datos.
- Descarga la base de datos de la página de [Datos Abiertos Dirección General de Epidemiología](https://www.gob.mx/salud/documentos/datos-abiertos-152127).
- Limpia los datos considerando solo los datos de Sonora de pacientes menores de 18 años.
- Genera un archivo PediatricoSonora.csv listo para ser analizado.

Posteriormente, la base de datos filtrada se copió a la computadora por medio del siguiente comando dentro del root del contenedor de docker:

<code>docker cp AnalisisCovid:/PediatricoSonora.csv .</code>



