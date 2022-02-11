# Analizando datos de COVID-19

# Contenidos
1. [Resumen](#Resumen)
2. [Metodología](#Metodologia)
3. [Resultados](#Resultados)

## Resumen ejecutivo

<div style="text-align: justify">
La presente página tiene como objetivo presentar los resultados de la actividad "Descargando y analizando los datos de COVID" del curso "Herramientas de Productividad para Ciencia de Datos" de la Universidad de Sonora.
El objetivo del ejercicio es determinar cuál es los factores de riesgo más comunes para los casos pediátricos reportados en la base de datos de la información proporcionada por la Dirección General de Epidemiología.
Dentro de un contenedor de Docker se corrió un script de la línea de comando de UNIX que permite considerar solo los casos del estado de Sonora de pacientes pediátricos.
Posteriormente, se utilizó un Jupyter Notebook dentro de un env de Conda en Visual Studio Code para determinar por medio de la libreria Pandas y SeaBorn los factores de riesgo que se presenta con mayor frecuencia en los pacientes menores de 18 años.
</div>

## Metodología

Por medio del un [Dockerfile](https://github.com/Maleniski/AnalisisCovid19/blob/main/AnalisisCovid_MalenaManzanares.dockerfile) (disponible en el repositorio) se baja un contenedor de ubuntu que incluye un [script de shell](https://github.com/Maleniski/AnalisisCovid19/blob/main/Covid19Script.sh) que realiza lo siguiente:

- Descarga la base de datos de la página de [Datos Abiertos Dirección General de Epidemiología](https://www.gob.mx/salud/documentos/datos-abiertos-152127).
- Limpia los datos considerando solo los datos de Sonora de pacientes menores de 18 años.
- Genera un archivo PediatricoSonora.csv listo para ser analizado.

Posteriormente, la base de datos filtrada se copió a la computadora por medio del siguiente comando dentro del root del contenedor de docker:

<code>docker cp AnalisisCovid:/PediatricoSonora.csv .</code>

## Resultados

El notebook con el análisis de los datos de los casos pediátricos puede encontrarse en [esta](https://github.com/Maleniski/AnalisisCovid19/blob/main/AnalisisPediatrico.ipynb) liga utilizando [esta](https://github.com/Maleniski/AnalisisCovid19/blob/main/PediatricoSonora.csv) base de datos, pero las gráficas resultantes fueron las siguientes.

Factores de riesgo más frecuentes en niños de 0 a 12 años de Sonora.
![ninos](https://github.com/Maleniski/AnalisisCovid19/raw/main/ninos.PNG)

Factores de riesgo más frecuentes en adolescentes de 12 a 18 años de Sonora.
![teen](https://github.com/Maleniski/AnalisisCovid19/raw/main/teen.PNG)
