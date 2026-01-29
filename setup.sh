#!/bin/bash

echo "~~~~~Setup 1.0 de OMAR~~~~~"

sudo apt update && sudo apt upgrade -y

#dependencias para el sistema y para el rtl 
echo "Iniciando instalación de dependencias del sistema mediante apt 1 de 2"
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
echo "Instalación de bibliotecas finalizada"
# una vez puesta la base, van las librerías de Python
echo "Iniciando Instalación de Bibliotecas de Python mediante pip 2 de 2"
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
    
     
