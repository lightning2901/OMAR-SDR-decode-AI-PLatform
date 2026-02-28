#!/bin/bash
# IMPORTANTE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
# CAMBIOS!!!! 28 FEB 2026
# 1.- EN LA PARTE SUPERIOR VAN TODAS LAS LIBRERÍAS GLOBALES DEL SISTEMA MEDIANTE APT
# 2.- DEPENDIENDO DEL HARDWARE OBJETIVO, YA SEA ESTACIÓN O SERVIDOR DEBE DE SELECCIONARSE AL INICIO PARA QUE EL INSTALADOR FUNCIONE 
# 3.- AL IGUAL QUE EL PUNTO ANTERIOR, LOS ENTORNOS VIRTUALES CREADOS RESPONDEN A LA PLATAFORMA ELEGIDA EN EL INSTALADOR AL INICIO

echo "~~~~~Setup 1.1 de OMAR~~~~~ \n ESTE INSTALADOR SÓLO DEBE SER UTILIZADO EN EL LINCC PARA LA CREACIÓN DE ESTACIONES O DE UN SERVIDOR OMAR"

sudo apt update && sudo apt upgrade -y

#dependencias para el sistema y para el rtl 
echo "Iniciando instalación de dependencias generales del sistema y para el uso del rtl 1 de 2"
sudo apt install -y \
     git \
     rtl-sdr \
     python3-pip \
     libsndfile1-dev \
     ffmpeg \
     sox \
     libsox-fmt-all \
     wireless-tools \
     net-tools
echo "Terminado"
echo "Iniciando instalación de dependencias generales del sistema y para el uso del rtl 2 de 2"
sudo apt install -y \
     build-essential \
     cmake \
     git \
     libusb-1.0-0-dev \
     pkg-config \
     librtlsdr-dev \
     rtl-sdr \
     sox
# una vez puesta la base, van las librerías de Python



echo "Iniciando Instalación de Bibliotecas de Python mediante pip 1 de 1"
pip install \
    request \
    numpy \
    install pyrtlsdr \
    flask \
    pydub \
    python-dotenv \
    psutil \
echo "Instalación de Bibiotecas de Python finalizada"
echo "Por favor edite edite y ejecute según lo necesario el wifi_setup.sh si es necesario antes de continuar"
    
     
