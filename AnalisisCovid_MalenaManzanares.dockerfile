FROM ubuntu

LABEL Malena Manzanares <a214200821@unison.mx>

WORKDIR /root

RUN apt-get -y update && \
    apt-get install -yq nano curl unzip less pip &&\
    pip install csvkit

ADD covid_script.sh  /

ENTRYPOINT ["/Covid19Script.sh"]