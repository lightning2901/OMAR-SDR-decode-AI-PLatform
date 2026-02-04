#!/usr/bin/env bash 
#este es el segundo archivo de configuración
#NO FUNCIONARÁ SI NO EJECUTAS setup.sh primero
#cabe recalcar que si llega a fallar lo primero que debe hacerse es verificar que la ruta de la cual clona el respositorio sea la correcta"
#cualquier duda del  RTL2832U ver https://osmocom.org/projects/rtl-sdr/wiki

read -p "Has desconectado el rtl-sdr? es mejor que lo hagas antes de iniciar la instalación Responde con y o n: " pregunta 
if
    [$pregunta == "y"]
    then
    
    echo "clonando el repositorio rtl-sdr"
    git clone https://github.com/osmocom/rtl-sdr.git
    echo "clonacion finalizada"
    echo  "cambiando al directorio clonado"
    cd rtl-sdr
    echo "dentro del directorio"
    echo "Creando directorios de compilación" 
    mkdir compilacion
    echo "entrando al directorio de compilación"
    cd compilacion
    echo "Dentro del directorio, iniciando compilación"
    cmake .. -DINSTALL_UDEV_RULES=ON
    make
    sudo make install
    sudo ldconfig
    echo "Compilación finalizada, "
    echo "Iniciando cambios al sistema para accesso sin root a las funciones del rtl si te pide credenciales de root, por favor otorgalas"
    
    sudo cp ../rtl-sdr.rules /etc/udev/rules.d/

    # Recarga las reglas udev
    sudo udevadm control --reload-rules
    sudo udevadm trigger
    else:
    echo "por favor desconecta antes de iniciar :) "
fi
    
