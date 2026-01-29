#!/bin/bash

echo "~~~~~Setup 1.0 de OMAR~~~~~"

sudo apt update && sudo apt upgrade -y

#dependencias para el sistema y para el rtl 
echo "Iniciando instalación de dependencias del sistema (generales) mediante apt 1 de 2"
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
echo "Instalación de bibliotecas generales finalizada"
echo "Iniciando instalación de dependencias del sistema (RTL-SDR) 2 de 2"
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
    
     
